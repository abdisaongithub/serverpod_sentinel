import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'Serverpod Sentinel',
  tagline: 'Enterprise-Grade AI-Powered Incident Management & Monitoring',
  favicon: 'img/favicon.ico',

  future: {
    v4: true,
  },

  url: 'https://sentinel.engineering',
  baseUrl: '/',

  organizationName: 'abdisaongithub', 
  projectName: 'serverpod_sentinel', 

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          editUrl:
            'https://github.com/abdisaongithub/serverpod_sentinel/tree/main/documentation/',
        },
        blog: {
          showReadingTime: true,
          editUrl:
            'https://github.com/abdisaongithub/serverpod_sentinel/tree/main/documentation/',
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    image: 'img/docusaurus-social-card.jpg',
    colorMode: {
      defaultMode: 'dark',
      respectPrefersColorScheme: true,
    },
    navbar: {
      title: 'Serverpod Sentinel',
      logo: {
        alt: 'Serverpod Sentinel Logo',
        src: 'img/logo.svg',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'tutorialSidebar',
          position: 'left',
          label: 'Documentation',
        },
        {to: '/blog', label: 'Engineering Blog', position: 'left'},
        {
          href: 'https://github.com/abdisaongithub/serverpod_sentinel',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Documentation',
          items: [
            {
              label: 'Introduction',
              to: '/docs/intro',
            },
            {
              label: 'Security Model',
              to: '/docs/security',
            },
            {
              label: 'Architecture',
              to: '/docs/architecture',
            },
          ],
        },
        {
          title: 'Community',
          items: [
            {
              label: 'GitHub Issues',
              href: 'https://github.com/abdisaongithub/serverpod_sentinel/issues',
            },
            {
              label: 'Serverpod Ecosystem',
              href: 'https://serverpod.dev',
            },
          ],
        },
        {
          title: 'More',
          items: [
            {
              label: 'Engineering Blog',
              to: '/blog',
            },
            {
              label: 'GitHub',
              href: 'https://github.com/abdisaongithub/serverpod_sentinel',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} Serverpod Sentinel Team. Built with Docusaurus.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
      additionalLanguages: ['dart', 'yaml', 'bash', 'powershell'],
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
