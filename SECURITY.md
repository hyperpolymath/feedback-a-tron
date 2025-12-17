# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |
| < 0.1   | :x:                |

## Reporting a Vulnerability

**Please do NOT report security vulnerabilities through public GitHub issues.**

Instead, please report security vulnerabilities via email to:
**security@hyperpolymath.org**

You should receive a response within 48 hours. If for some reason you do not,
please follow up via email to ensure we received your original message.

Please include the following information in your report:
- Type of vulnerability (e.g., buffer overflow, SQL injection, cross-site scripting)
- Full paths of source file(s) related to the vulnerability
- Location of the affected source code (tag/branch/commit or direct URL)
- Any special configuration required to reproduce the issue
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit it

## Preferred Languages

We prefer all communications to be in English.

## Disclosure Policy

- We will respond to your report within 48 hours
- We will keep you informed of the progress towards a fix
- We will credit reporters in security advisories (unless they prefer to remain anonymous)

## Security Requirements

This project follows the Rhodium Standard Repository (RSR) security requirements:
- No MD5/SHA1 for cryptographic purposes (SHA256+ required)
- HTTPS only (no insecure HTTP URLs)
- No hardcoded secrets in source code
- SHA-pinned GitHub Actions for supply chain security
- SPDX license headers on all source files
