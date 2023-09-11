import { HelperLike } from '@glint/template';

declare const pageTitle: HelperLike<{
  Args: { Positional: [title?: string]; Named: { replace: boolean } };
  Return: void;
}>;

export default pageTitle;
