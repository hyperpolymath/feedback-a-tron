;;; STATE.scm - Project Checkpoint
;;; feedback-a-tron
;;; Format: Guile Scheme S-expressions
;;; Purpose: Preserve AI conversation context across sessions
;;; Reference: https://github.com/hyperpolymath/state.scm

;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

;;;============================================================================
;;; METADATA
;;;============================================================================

(define metadata
  '((version . "0.1.1")
    (schema-version . "1.0")
    (created . "2025-12-15")
    (updated . "2025-12-17")
    (project . "feedback-a-tron")
    (repo . "github.com/hyperpolymath/feedback-a-tron")))

;;;============================================================================
;;; PROJECT CONTEXT
;;;============================================================================

(define project-context
  '((name . "feedback-a-tron")
    (tagline . "GitHub repository management with Datalog analysis")
    (version . "0.1.1")
    (license . "AGPL-3.0-or-later")
    (rsr-compliance . "gold-target")

    (tech-stack
     ((primary . "Elixir/OTP (MCP server), Julia (analytics), Nickel (config)")
      (ci-cd . "GitHub Actions + GitLab CI + Bitbucket Pipelines")
      (security . "CodeQL + OSSF Scorecard + SHA-pinned Actions")
      (package-mgmt . "Guix (primary) / Nix (fallback)")))))

;;;============================================================================
;;; CURRENT POSITION
;;;============================================================================

(define current-position
  '((phase . "v0.1 - Security Hardening Complete")
    (overall-completion . 35)

    (components
     ((rsr-compliance
       ((status . "complete")
        (completion . 100)
        (notes . "SHA-pinned actions, SPDX headers, multi-platform CI")))

      (security
       ((status . "complete")
        (completion . 100)
        (notes . "All workflows SHA-pinned, SECURITY.md complete, security.txt RFC 9116 compliant")))

      (scm-files
       ((status . "complete")
        (completion . 100)
        (notes . "guix.scm and flake.nix with SPDX headers, correct licenses")))

      (documentation
       ((status . "foundation")
        (completion . 40)
        (notes . "README, META/ECOSYSTEM/STATE.scm, ARCHITECTURE.md")))

      (testing
       ((status . "minimal")
        (completion . 10)
        (notes . "CI/CD scaffolding exists, limited test coverage")))

      (core-functionality
       ((status . "in-progress")
        (completion . 25)
        (notes . "Elixir MCP foundation, Julia stats package defined")))))

    (working-features
     ("RSR-compliant CI/CD pipeline with 9 workflows"
      "Multi-platform mirroring (GitHub, GitLab, Bitbucket)"
      "SPDX license headers on all files"
      "SHA-pinned GitHub Actions (supply chain security)"
      "RFC 9116 security.txt compliance"
      "OSSF Scorecard integration"
      "Guix + Nix reproducible builds"))))

;;;============================================================================
;;; ROUTE TO MVP
;;;============================================================================

(define route-to-mvp
  '((target-version . "1.0.0")
    (definition . "Stable release with comprehensive documentation and tests")

    (milestones
     ((v0.2
       ((name . "Core MCP Functionality")
        (status . "next")
        (items
         ("Implement Elixir MCP server endpoints"
          "Connect GitHub API integration"
          "Add Datalog/SPARQL query support"
          "Basic test coverage for core modules"))))

      (v0.3
       ((name . "Analytics & Configuration")
        (status . "pending")
        (items
         ("Julia analytics pipeline"
          "Nickel configuration validation"
          "Multi-repo scraper implementation"
          "Integration tests"))))

      (v0.4
       ((name . "Container & Deployment")
        (status . "pending")
        (items
         ("Wolfi container builds working"
          "Guix channel deployment"
          "Health checks and monitoring"
          "Performance benchmarks"))))

      (v0.5
       ((name . "Feature Complete")
        (status . "pending")
        (items
         ("All planned features implemented"
          "Test coverage > 70%"
          "API stability"
          "Documentation complete"))))

      (v1.0
       ((name . "Production Release")
        (status . "pending")
        (items
         ("Comprehensive test coverage"
          "Performance optimization"
          "Security audit complete"
          "User documentation"
          "Release notes and changelog"))))))))

;;;============================================================================
;;; BLOCKERS & ISSUES
;;;============================================================================

(define blockers-and-issues
  '((critical
     ())  ;; No critical blockers

    (high-priority
     ())  ;; No high-priority blockers

    (medium-priority
     ((test-coverage
       ((description . "Limited test infrastructure")
        (impact . "Risk of regressions")
        (needed . "Comprehensive test suites for Elixir and Julia")))

      (deno-conversion
       ((description . "npm to Deno conversion pending")
        (impact . "Any future JS/TS work blocked until converted")
        (needed . "Create deno.json, update imports")))))

    (low-priority
     ((documentation-gaps
       ((description . "Some documentation areas incomplete")
        (impact . "Harder for new contributors")
        (needed . "Expand API and usage documentation")))))))

;;;============================================================================
;;; CRITICAL NEXT ACTIONS
;;;============================================================================

(define critical-next-actions
  '((immediate
     (("Implement MCP server core endpoints" . high)
      ("Add GitHub API client" . high)
      ("Create initial Elixir test suite" . medium)))

    (this-week
     (("Datalog store integration" . high)
      ("Julia analytics prototypes" . medium)
      ("Container build testing" . medium)))

    (this-month
     (("Reach v0.2 milestone" . high)
      ("Complete Nickel config validation" . medium)
      ("Multi-repo scraper MVP" . medium)))))

;;;============================================================================
;;; SESSION HISTORY
;;;============================================================================

(define session-history
  '((snapshots
     ((date . "2025-12-15")
      (session . "initial-state-creation")
      (accomplishments
       ("Added META.scm, ECOSYSTEM.scm, STATE.scm"
        "Established RSR compliance"
        "Created initial project checkpoint"))
      (notes . "First STATE.scm checkpoint created via automated script"))

     ((date . "2025-12-17")
      (session . "security-hardening")
      (accomplishments
       ("SHA-pinned all GitHub Actions (9 workflows)"
        "Added SPDX headers to guix.scm and flake.nix"
        "Fixed license inconsistency (asl20 -> agpl3Plus)"
        "Updated security.txt with proper expiry date"
        "Rewrote SECURITY.md with project-specific details"
        "Added top-level permissions: read-all to workflows"))
      (notes . "Security audit and hardening session")))))

;;;============================================================================
;;; HELPER FUNCTIONS (for Guile evaluation)
;;;============================================================================

(define (get-completion-percentage component)
  "Get completion percentage for a component"
  (let ((comp (assoc component (cdr (assoc 'components current-position)))))
    (if comp
        (cdr (assoc 'completion (cdr comp)))
        #f)))

(define (get-blockers priority)
  "Get blockers by priority level"
  (cdr (assoc priority blockers-and-issues)))

(define (get-milestone version)
  "Get milestone details by version"
  (assoc version (cdr (assoc 'milestones route-to-mvp))))

;;;============================================================================
;;; EXPORT SUMMARY
;;;============================================================================

(define state-summary
  '((project . "feedback-a-tron")
    (version . "0.1.1")
    (overall-completion . 35)
    (next-milestone . "v0.2 - Core MCP Functionality")
    (critical-blockers . 0)
    (high-priority-issues . 0)
    (security-status . "hardened")
    (updated . "2025-12-17")))

;;; End of STATE.scm
