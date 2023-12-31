import { CodeBlock } from 'ember-shiki';

const codeExample = `
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

/// Post including an author and content.
model Post {
  id        Int         @default(autoincrement()) @id
  content   String?
  published Boolean     @default(false)
  author    User?       @relation(fields: [authorId], references: [id])
  authorId  Int?
}

// Documentation for this model.
model User {
  id    Int     @default(autoincrement()) @id
  email String  @unique
  name  String?
  posts Post[]
  specialName UserName
  test Test
}

/// This is an enum specifying the UserName.
enum UserName {
    Fred
    Eric
}

// This is a test enum.
enum Test {
  TestUno
  TestDue
}

// taken from https://github.com/prisma/language-tools/blob/master/packages/vscode/testFixture/hover.prisma
`;

<template>
  <CodeBlock @code={{codeExample}} @language="prisma" />
</template>
