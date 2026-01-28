import type {ReactNode} from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import Heading from '@theme/Heading';

import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <Heading as="h1" className="hero__title">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
            to="/docs/intro">
            Get Started with Sentinel 🚀
          </Link>
          <Link
            className="button button--outline button--secondary button--lg margin-left--md"
            to="https://github.com/abdisaongithub/serverpod_sentinel">
            View on GitHub
          </Link>
        </div>
      </div>
    </header>
  );
}

function Feature({title, description, icon}: {title: string, description: string, icon: string}) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center padding-horiz--md margin-bottom--lg">
        <div className={styles.featureIcon}>{icon}</div>
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

const FeatureList = [
  {
    title: 'Hardened Security',
    icon: '🛡️',
    description: (
      <>
        Granular RBAC, AES-256 encryption at rest, and TOTP Multi-Factor Authentication
        built into the core protocol.
      </>
    ),
  },
  {
    title: 'AI-Powered Analysis',
    icon: '🧠',
    description: (
      <>
        Automated Root Cause Analysis using LLMs. Correlate telemetry spikes with
        recent audit log changes instantly.
      </>
    ),
  },
  {
    title: 'Autonomous Remediation',
    icon: '⚙️',
    description: (
      <>
        Self-healing policies that automatically trigger playbooks to resolve incidents
        without human intervention.
      </>
    ),
  },
];

export default function Home(): ReactNode {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`${siteConfig.title} | Enterprise Observability`}
      description="The definitive guide to Serverpod Sentinel: Enterprise-grade monitoring and incident management.">
      <HomepageHeader />
      <main>
        <section className={styles.features}>
          <div className="container">
            <div className="row">
              {FeatureList.map((props, idx) => (
                <Feature key={idx} {...props} />
              ))}
            </div>
          </div>
        </section>
      </main>
    </Layout>
  );
}
