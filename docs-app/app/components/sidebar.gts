import { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import slugify from 'slugify';

const SidebarTitle: TOC<{ Args: { text: string } }> = <template>
  <li>
    <a
      href='#{{slugify @text (hash lower=true)}}'
      class='flex items-center hover:text-blue-600 font-semibold text-gray-200 py-2'
    >
      <span>{{@text}}</span>
    </a>
  </li>
</template>;

const SidebarItem: TOC<{ Args: { text: string } }> = <template>
  <li>
    <a
      href='#{{slugify @text (hash lower=true)}}'
      class='flex items-center text-gray-400 hover:text-blue-500 py-2'
    >
      <span>{{@text}}</span>
    </a>
  </li>
</template>;

const Separator: TOC<{}> = <template>
  <hr class='h-px my-4 border-0 bg-gray-700' />
</template>;

const Sidebar: TOC<{}> = <template>
  <aside
    id='default-sidebar'
    class='2xl:absolute top-0 2xl:-left-64 w-64 h-screen flex-shrink-0 hidden md:block'
    aria-label='Sidebar'
  >
    <div class='h-full fixed top-0 px-6 py-4 overflow-y-auto w-64 flex justify-between flex-col'>
      <ul class='text-sm'>
        <li class='text-lg'>
          <a
            href='#ember-shiki'
            class='flex items-center hover:text-blue-600 font-semibold text-gray-200'
          >
            <span class='mr-2'>🌈</span>
            <span>ember-shiki</span>
          </a>
        </li>
        <Separator />
        <SidebarTitle @text='Getting started' />
        <SidebarItem @text='Installation' />
        <SidebarItem @text='Usage' />
        <SidebarItem @text='Glint types' />
        <SidebarItem @text='Configure (optional)' />
        <Separator />

        <SidebarTitle @text='Options' />
        <SidebarItem @text='Language' />
        <SidebarItem @text='Theme' />
        <SidebarItem @text='Code block name' />
        <SidebarItem @text='Copy to clipboard' />
        <SidebarItem @text='Code groups' />
        <SidebarItem @text='Line numbers' />
        <SidebarItem @text='Line highlighting' />
        <SidebarItem @text='Loading state' />
        <SidebarItem @text='Custom fonts' />
        <Separator />

        <SidebarTitle @text='Advanced' />
        <SidebarItem @text='Custom grammar' />
      </ul>

      <p class="text-xs text-gray-500 mt-4">Built by
        <a href='https://ignacemaes.com' class="hover:text-blue-500">Ignace Maes</a>.</p>
    </div>
  </aside>
</template>;

export default Sidebar;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Sidebar: typeof Sidebar;
  }
}
