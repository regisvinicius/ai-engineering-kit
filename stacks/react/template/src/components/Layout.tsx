import type { PropsWithChildren } from "react";

export function Layout({ children }: PropsWithChildren) {
  return (
    <main
      style={{
        minHeight: "100vh",
        display: "grid",
        placeItems: "center",
        margin: 0,
        fontFamily: "system-ui, sans-serif",
        background: "linear-gradient(135deg, #f4f7fb 0%, #dce8f7 100%)"
      }}
    >
      <section
        style={{
          padding: "2rem 2.5rem",
          borderRadius: "1rem",
          backgroundColor: "#ffffff",
          boxShadow: "0 18px 45px rgba(30, 41, 59, 0.12)",
          textAlign: "center"
        }}
      >
        {children}
      </section>
    </main>
  );
}
