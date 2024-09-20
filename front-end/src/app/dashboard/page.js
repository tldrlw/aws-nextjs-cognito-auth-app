"use client";
import { useState } from "react";
import { signOut } from "aws-amplify/auth";
import { useRouter } from "next/navigation";

export default function Dashboard() {
  const [errorMessage, setErrorMessage] = useState(null);
  const router = useRouter(); // Initialize useRouter for client-side redirects

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      // Form action dispatch
      const response = await signOut();
      // Handle successful login
      console.log("Logged out successfully", response);
      router.push("/");
    } catch (error) {
      setErrorMessage(error.message);
    }
  };

  return (
    <main className="container">
      <h1 className="text-cyan-800 text-xl p-2 md:py-2">
        aws-nextjs-cognito-auth-app
      </h1>
      <div className="p-2 md:py-2">
        <div className="w-full md:w-1/3">
          <h2 className="text-cyan-700 text-lg">dashboard</h2>
          {errorMessage && <p className="text-red-500 mb-4">{errorMessage}</p>}
          <form className="py-2" onSubmit={handleSubmit}>
            <button
              type="submit"
              className="w-full bg-red-500 text-white py-2 px-4 rounded-md hover:bg-red-600 transition duration-200"
            >
              sign out
            </button>
          </form>
        </div>
      </div>
    </main>
  );
}
