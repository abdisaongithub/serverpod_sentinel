import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

const config: Config = {
  title: 'Serverpod Sentinel',
  tagline: 'AI-Powered Incident Management & Monitoring',
  favicon: 'img/favicon.ico',

  // Future flags, see https://docusaurus.io/docs/api/docusaurus-config#future
  future: {
    v4: true,
  },

  // Set the production url of your site here
  url: 'https://sentinel.docs.example.com',
  // Set the /<baseUrl>/ pathname under which your site is served
  baseUrl: '/docs/',

  // GitHub pages deployment config.
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
    // Replace with your project's social card
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
        {to: '/blog', label: 'Security Blog', position: 'left'},
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
          title: 'Docs',
          items: [
            {
              label: 'Getting Started',
              to: '/docs/intro',
            },
            {
              label: 'Architecture',
              to: '/docs/intro', // Update later
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
              label: 'Serverpod Forum',
              href: 'https://serverpod.dev',
            },
          ],
        },
        {
          title: 'More',
          items: [
            {
              label: 'Security Blog',
              to: '/blog',
            },
            {
              label: 'GitHub',
              href: 'https://github.com/abdisaongithub/serverpod_sentinel',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} Serverpod Sentinel. Built with Docusaurus.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
      additionalLanguages: ['dart', 'yaml', 'bash', 'powershell'],
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
