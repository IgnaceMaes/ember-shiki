import { CodeBlock } from 'ember-shiki';

const codeExample = `
syntax = "proto3";

package mypackage.books.v1;

import "google/protobuf/empty.proto";
import "google/api/field_behavior.proto";

import "google/api/annotations.proto";

option go_package = "mypackage.books.v1/books";

// Book service
service BooksService {
	// Get a book.
	rpc GetBook(GetBookRequest) returns (Book) {
		option (google.api.http) = {
			get: "/resources/store/v1/{name=books/*}"
		};
	}
}

// The definition of a book resource.
message Book {
	// The name of the book.
	// Format: books/{book}.
	string name = 1 [(google.api.field_behavior) = OUTPUT_ONLY];

	// The display name of the book.
	string display_name = 2 [(google.api.field_behavior) = REQUIRED];

	// The authors of the book.
	repeated string authors = 3 [(google.api.field_behavior) = REQUIRED];

	// The publisher of the book
	string publisher = 4 [(google.api.field_behavior) = OPTIONAL];
}

// Request message for [play.me.resources.books.v1.BooksService.GetBook].
message GetBookRequest {
	// The book name is the unique identifier across organisations.
	// Format: books/{book}
	string name = 1 [(google.api.field_behavior) = REQUIRED];
}

// From https://alis.build/guides/how-to-guides/make-your-first-request.html#book-repository-example`;

<template>
  <CodeBlock @code={{codeExample}} @language="proto" />
</template>
