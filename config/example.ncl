# Example configuration for feedback-a-tron
# Copy to ~/.config/feedback-a-tron/config.ncl

let schema = import "./schema.ncl" in

schema.Config & {
  github = {
    # Token from environment: GITHUB_TOKEN or GH_TOKEN
    # Or set explicitly (not recommended for version control):
    # token = "ghp_xxxxxxxxxxxx",
    
    default_repo = "anthropics/claude-code",
  },
  
  repos = [
    {
      owner = "anthropics",
      name = "claude-code",
      analysis = {
        enabled = true,
        auto_ingest = true,
        ingest_interval_hours = 12,
      },
      components = {
        "memory" = "session_management",
        "area:core" = "session_management",
        "area:mcp" = "mcp_integration",
        "area:ui" = "ui_layer",
      },
      tracked_labels = [
        "bug",
        "enhancement",
        "memory",
        "area:core",
        "area:mcp",
      ],
    },
    # Add more repos as needed
    # {
    #   owner = "hyperpolymath",
    #   name = "feedback-a-tron",
    #   ...
    # },
  ],
  
  datalog = {
    backend = 'ets,
    persist = true,
    rules = {
      enable_state_sync_rules = true,  # For tracking the archive bug!
    },
  },
  
  mcp = {
    enabled = true,
    stdio = true,
    tools = {
      create_issue = true,
      analyze_issues = true,
      datalog_query = true,
      # Keep dangerous tools off by default
      branch_protection = false,
      trigger_workflow = false,
    },
  },
  
  oxigraph = {
    enabled = false,  # Enable if you want full RDF/SPARQL
  },
  
  julia_stats = {
    enabled = false,  # Enable for personal activity tracking
    track = {
      my_issues = true,
      my_prs = true,
      contributions = true,
    },
  },
  
  web_ui = {
    enabled = false,  # Enable for dashboard
    port = 3000,
  },
}
