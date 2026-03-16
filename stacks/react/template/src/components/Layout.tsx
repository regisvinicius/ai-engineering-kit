import { Link } from "@tanstack/react-router";
import type { PropsWithChildren } from "react";

export function Layout({ children }: PropsWithChildren) {
  return (
    <main className="min-h-screen grid place-items-center m-0 font-sans bg-gradient-to-br from-slate-100 to-slate-200">
      <nav className="absolute top-4 left-4 flex gap-4">
        <Link
          to="/"
          className="text-slate-600 hover:text-slate-900"
          activeProps={{ className: "font-semibold text-slate-900" }}
        >
          Home
        </Link>
        <Link
          to="/about"
          className="text-slate-600 hover:text-slate-900"
          activeProps={{ className: "font-semibold text-slate-900" }}
        >
          About
        </Link>
      </nav>
      <section className="p-8 rounded-xl bg-white shadow-lg text-center">
        {children}
      </section>
    </main>
  );
}
