import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Мир Услуг — услуги города в одном месте",
  description:
    "Современная Next.js-версия интерфейса старого сервиса «Мир Услуг».",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ru">
      <body>{children}</body>
    </html>
  );
}
