import { CodeBlock } from 'ember-shiki';

const codeExample = `
<!DOCTYPE html>
<html lang="en-us">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>MDN Web Docs Example: Toggling full-screen mode</title>
    <link rel="stylesheet" href="styles.css">
    <style class="editable">
        video::backdrop {
          background-color: #448;
        }
    </style>

    <!-- import the webpage's javascript file -->
    <script src="script.js" defer></script>
  </head>
  <body>
    <section class="preview">
      <video controls
        src="https://archive.org/download/BigBuckBunny_124/Content/big_buck_bunny_720p_surround.mp4"
        poster="https://peach.blender.org/wp-content/uploads/title_anouncement.jpg?x11217"
        width="620">

        Sorry, your browser doesn't support embedded videos.  Time to upgrade!

      </video>
    </section>

<textarea class="playable playable-css" style="height: 100px;">
video::backdrop {
  background-color: #448;
}
</textarea>

<textarea class="playable playable-html" style="height: 200px;">
<video controls
  src="https://archive.org/download/BigBuckBunny_124/Content/big_buck_bunny_720p_surround.mp4"
  poster="https://peach.blender.org/wp-content/uploads/title_anouncement.jpg?x11217"
  width="620">
Sorry, your browser doesn't support embedded videos.  Time to upgrade!
</video>
</textarea>

    <div class="playable-buttons">
        <input id="reset" type="button" value="Reset" />
      </div>
    </body>
    <script src="playable.js"></script>
  </body>
</html>

<!-- From https://github.com/mdn/css-examples/blob/main/backdrop/index.html -->
`;

<template>
  <CodeBlock @code={{codeExample}} @language="html" />
</template>
