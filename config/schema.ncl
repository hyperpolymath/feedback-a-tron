# Feedback-a-tron Configuration Schema
# Nickel provides typed configuration with contracts

let GitHubConfig = {
  token | String | optional,
  api_url | String | default = "https://api.github.com",
  default_repo | String | optional,
  
  # Rate limiting
  rate_limit | {
    requests_per_hour | Number | default = 5000,
    retry_after_seconds | Number | default = 60,
  } | default = {},
}

let RepoConfig = {
  owner | String,
  name | String,
  
  # Analysis settings
  analysis | {
    enabled | Bool | default = true,
    auto_ingest | Bool | default = false,
    ingest_interval_hours | Number | default = 24,
  } | default = {},
  
  # Component mappings for this repo
  components | { _ : String } | default = {},
  
  # Custom labels to track
  tracked_labels | Array String | default = [],
}

let DatalogConfig = {
  # Fact store backend
  backend | [| 'ets, 'sqlite, 'oxigraph |] | default = 'ets,
  
  # Persistence
  persist | Bool | default = false,
  persist_path | String | default = "~/.local/share/feedback-a-tron/facts.db",
  
  # Analysis rules
  rules | {
    enable_relationship_rules | Bool | default = true,
    enable_bug_pattern_rules | Bool | default = true,
    enable_state_sync_rules | Bool | default = true,
    enable_component_rules | Bool | default = true,
    enable_author_rules | Bool | default = true,
  } | default = {},
}

let McpConfig = {
  # Server settings
  enabled | Bool | default = true,
  stdio | Bool | default = true,  # Use stdio (for Claude Code integration)
  http_port | Number | optional,  # Optional HTTP server
  
  # Tool settings
  tools | {
    create_issue | Bool | default = true,
    search_issues | Bool | default = true,
    analyze_issues | Bool | default = true,
    datalog_query | Bool | default = true,
    branch_protection | Bool | default = false,  # Dangerous, off by default
    trigger_workflow | Bool | default = false,   # Dangerous, off by default
  } | default = {},
}

let OxigraphConfig = {
  enabled | Bool | default = false,
  endpoint | String | default = "http://localhost:7878",
  
  # Import settings
  import_github_issues | Bool | default = true,
  import_prs | Bool | default = false,
  import_commits | Bool | default = false,
  
  # SPARQL settings
  default_graph | String | default = "urn:feedback-a-tron:default",
}

let JuliaStatsConfig = {
  enabled | Bool | default = false,
  
  # What to track
  track | {
    my_issues | Bool | default = true,
    my_prs | Bool | default = true,
    my_comments | Bool | default = true,
    my_reviews | Bool | default = true,
    watched_repos | Bool | default = true,
    contributions | Bool | default = true,
  } | default = {},
  
  # Export settings
  export_csv | Bool | default = true,
  export_path | String | default = "~/.local/share/feedback-a-tron/stats/",
}

let WebUiConfig = {
  enabled | Bool | default = false,
  port | Number | default = 3000,
  host | String | default = "localhost",
}

# Main configuration contract
let Config = {
  # Core settings
  github | GitHubConfig,
  
  # Repositories to manage
  repos | Array RepoConfig | default = [],
  
  # Datalog analysis engine
  datalog | DatalogConfig | default = {},
  
  # MCP server
  mcp | McpConfig | default = {},
  
  # RDF store (optional)
  oxigraph | OxigraphConfig | default = {},
  
  # Statistics (optional)
  julia_stats | JuliaStatsConfig | default = {},
  
  # Web UI (optional)
  web_ui | WebUiConfig | default = {},
}

# Export the schema
{
  Config,
  GitHubConfig,
  RepoConfig,
  DatalogConfig,
  McpConfig,
  OxigraphConfig,
  JuliaStatsConfig,
  WebUiConfig,
}
