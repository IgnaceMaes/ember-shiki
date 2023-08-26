import Modifier from 'ember-modifier';
import { service } from '@ember/service';
import ShikiService from '../services/shiki';
import type { Lang, Theme } from 'shiki';
import { task } from 'ember-concurrency';
import { LineHighlight } from '../components/code-block';

type Positional = [];
type Named = {
  code: string;
  language?: Lang | string;
  theme?: Theme | string;
  onCodeHighlighted?: (
    rendered: string,
    code: string,
    language?: Lang | string,
    theme?: Theme | string,
  ) => void;
  lineHighlights?: LineHighlight[];
};
export interface ShikiRenderSignature {
  Element: Element;
  Args: {
    Positional: Positional;
    Named: Named;
  };
}

export default class ShikiRender extends Modifier<ShikiRenderSignature> {
  @service declare shiki: ShikiService;

  modify(
    element: Element,
    _: Positional,
    { code, language, theme, onCodeHighlighted, lineHighlights }: Named,
  ) {
    this.render.perform(
      code,
      language,
      theme,
      onCodeHighlighted,
      lineHighlights,
    );
  }

  render = task(
    {},
    async (
      code: Named['code'],
      language?: Named['language'],
      theme?: Named['theme'],
      onCodeHighlighted?: Named['onCodeHighlighted'],
      lineHighlights?: Named['lineHighlights'],
    ) => {
      const rendered = await this.shiki.render.perform(
        code,
        language,
        theme,
        lineHighlights,
      );

      onCodeHighlighted?.(rendered, code, language, theme);
    },
  );
}
