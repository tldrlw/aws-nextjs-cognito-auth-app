import { authConfig } from "@/app/amplify-cognito-config";
import { createServerRunner } from "@aws-amplify/adapter-nextjs";
import { fetchAuthSession, getCurrentUser } from "aws-amplify/auth/server";
// ^ the /server is important because these functions will get called on the server-side

export const { runWithAmplifyServerContext } = createServerRunner({
  config: {
    Auth: authConfig,
  },
});

export async function authenticatedUser(context) {
  const adminGroupName = "Admins";
  // ^ must match up exactly with what you're naming your group, see infrastructure/cognito.tf

  return await runWithAmplifyServerContext({
    nextServerContext: context,
    operation: async (contextSpec) => {
      try {
        const session = await fetchAuthSession(contextSpec);
        // console.log(
        //   "server-side log (front-end/src/utils/amplify-server-utils.js) - fetchAuthSession() - session",
        //   session
        // );
        // console.log(
        //   "server-side log (front-end/src/utils/amplify-server-utils.js) - fetchAuthSession() - session.tokens.idToken.toString()",
        //   session.tokens.idToken.toString()
        // );
        if (!session.tokens) {
          return;
        }
        const user = {
          ...(await getCurrentUser(contextSpec)),
          isAdmin: false,
        };
        const groups = session.tokens.accessToken.payload["cognito:groups"];
        user.isAdmin = Boolean(groups && groups.includes(adminGroupName));
        return user;
      } catch (error) {
        console.log(error);
      }
    },
  });
}
