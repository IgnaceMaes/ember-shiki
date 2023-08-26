// Add any types here that you need for local development only.
// These will *not* be published as part of your addon, so be careful that your published code does not rely on them!
import 'ember-source/types';
import '@glint/environment-ember-loose';
import type EmberShikiRegistery from '../src/template-registry';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry extends EmberShikiRegistery {}
}
