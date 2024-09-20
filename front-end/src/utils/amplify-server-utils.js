import { authConfig } from "@/app/amplify-cognito-config";
import { createServerRunner } from "@aws-amplify/adapter-nextjs";

export const { runAmplifyServerContext } = createServerRunner({
  config: {
    Auth: authConfig,
  },
});
