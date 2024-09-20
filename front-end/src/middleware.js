import { NextResponse } from "next/server";
import { authenticatedUser } from "@/utils/amplify-server-utils";

export async function middleware(request) {
  const response = NextResponse.next();
  const user = await authenticatedUser({ request, response });
  // console.log(
  //   "server-side log - middleware - authenticatedUser() - user",
  //   user
  // );

  const isOnDashboard = request.nextUrl.pathname.startsWith("/dashboard");
  const isOnAdminArea =
    request.nextUrl.pathname.startsWith("/dashboard/admins");

  if (isOnDashboard) {
    if (!user)
      return NextResponse.redirect(new URL("/auth/login", request.nextUrl));
    if (isOnAdminArea && !user.isAdmin)
      return NextResponse.redirect(new URL("/dashboard", request.nextUrl));
    return response;
  } else if (user) {
    return NextResponse.redirect(new URL("/dashboard", request.nextUrl));
  }
}

export const config = {
  /*
   * Match all request paths except for the ones starting with
   */
  matcher: ["/((?!api|_next/static|_next/image|.*\\.png$).*)"],
};
