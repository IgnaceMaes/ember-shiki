import { TOC } from '@ember/component/template-only';

const InlineCode: TOC<{ Blocks: { default: [] } }> = <template>
  <span class="px-2 py-1.5 text-xs font-mono bg-gray-800 text-gray-300 border-gray-500 rounded">{{yield}}</span>
</template>;

export default InlineCode;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    InlineCode: typeof InlineCode;
  }
}
