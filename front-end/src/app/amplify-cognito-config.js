"use client";

import { Amplify } from "aws-amplify";
// import "../../envConfig";
// ^ https://nextjs.org/docs/pages/building-your-application/configuring/environment-variables#loading-environment-variables-with-nextenv
// ^ but don't need this import here since we're using NEXT_PUBLIC.. in a client component

console.log(
  "process.env.NEXT_PUBLIC_COGNITO_USER_POOL_ID",
  process.env.NEXT_PUBLIC_COGNITO_USER_POOL_ID
);
console.log(
  "process.env.NEXT_PUBLIC_COGNITO_USER_POOL_CLIENT_ID",
  process.env.NEXT_PUBLIC_COGNITO_USER_POOL_CLIENT_ID
);
// ^ defined in .env.local
// ^ https://nextjs.org/docs/pages/building-your-application/configuring/environment-variables#loading-environment-variables-with-nextenv
// ^ using NEXT_PUBLIC... because this is client-side

const userPoolId =
  process.env.NEXT_PUBLIC_COGNITO_USER_POOL_ID || "placeholder_pool_id";
const userPoolClientId =
  process.env.NEXT_PUBLIC_COGNITO_USER_POOL_CLIENT_ID ||
  "placeholder_client_id";
// ^ logic above since these env vars are not available at build time, would get errors without this

export const authConfig = {
  Cognito: {
    userPoolId,
    userPoolClientId,
  },
};

Amplify.configure({ Auth: authConfig }, { ssr: true });
// setting ssr to true will make Amplify use cookie for state storage, because by default, Amplify uses local storage for state storage

export default function ConfigureAmplifyClientSide() {
  return null;
  // returning null because this component will have no UI
}
