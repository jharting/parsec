-- User Lookup Data Source (Mock Implementation)
--
-- Returns mock user data for testing. Replace with actual API calls in production.
--
-- Expected input:
--   input.subject.claims.user_id - The user ID to look up
--   input.subject.claims.reason  - The reason for impersonation (for audit)

function fetch(input)
  local user_id = input.subject.claims.user_id
  if user_id == nil or user_id == "" then
    error("user_id not found in subject claims")
  end

  -- Mock user data - replace with actual API call in production
  local user = {
    id = tonumber(user_id) or 0,
    username = "user-" .. user_id,
    email = "user-" .. user_id .. "@example.com",
    first_name = "Test",
    last_name = "User",
    account_number = "000001",
    is_active = true,
    is_org_admin = false,
    is_internal = false,
    locale = "en_US",
    org_id = "1234567",
    display_name = "Test User"
  }

  return {data = json.encode(user), content_type = "application/json"}
end

-- Cache key function - cache by user_id only
function cache_key(input)
  return {subject = {claims = {user_id = input.subject.claims.user_id}}}
end
