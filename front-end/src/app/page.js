import Login from "./auth/login/page";
import "../../envConfig";
// ^ https://nextjs.org/docs/pages/building-your-application/configuring/environment-variables#loading-environment-variables-with-nextenv

console.log(
  "process.env.COGNITO_USER_POOL_ID",
  process.env.COGNITO_USER_POOL_ID
);
console.log(
  "process.env.COGNITO_USER_POOL_CLIENT_ID",
  process.env.COGNITO_USER_POOL_CLIENT_ID
);
// ^ defined in .env.local
// ^ https://nextjs.org/docs/pages/building-your-application/configuring/environment-variables#loading-environment-variables-with-nextenv

export default function Home() {
  return (
    <main className="container">
      <h1 className="text-cyan-800 text-xl p-2 md:py-2">
        aws-nextjs-cognito-auth-app
      </h1>
      <Login></Login>
    </main>
  );
}
