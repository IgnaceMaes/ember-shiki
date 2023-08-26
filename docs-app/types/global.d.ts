import '@glint/environment-ember-loose';
import '@glint/environment-ember-template-imports';
import 'ember-source/types';
import type EmberShikiRegistery from 'ember-shiki/template-registry';
import { HelperLike } from '@glint/template';

declare module '*.css' {
  const styles: { [className: string]: string };
  export default styles;
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry extends EmberShikiRegistery {
    'page-title': HelperLike<{
      Args: { Positional: [title?: string] };
      Return: void;
    }>;
  }
}
