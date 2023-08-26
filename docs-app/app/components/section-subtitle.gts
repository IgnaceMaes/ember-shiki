import { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import slugify from 'slugify';

const SectionSubtitle: TOC<{ Args: { text: string } }> = <template>
  <h3 id="{{slugify @text (hash lower=true)}}" class="text-2xl font-bold mt-16 mb-4">{{@text}}</h3>
</template>;

export default SectionSubtitle;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    SectionSubtitle: typeof SectionSubtitle;
  }
}
