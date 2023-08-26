import { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import slugify from 'slugify';

const SectionTitle: TOC<{ Args: { text: string } }> = <template>
  <h2 id="{{slugify @text (hash lower=true)}}" class="text-4xl font-bold mt-16 -mb-8">{{@text}}</h2>
</template>;

export default SectionTitle;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    SectionTitle: typeof SectionTitle;
  }
}
