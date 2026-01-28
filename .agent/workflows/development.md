---
description: Standard workflow for adding features or debugging the TripMaster application
---

1. ACQUIRE CONTEXT
   - Read relevant `Controller`, `DAO`, and `JSP` files to understand current logic.
   - If database issues are suspected, inspect schema/data:
     `mysql -u tripmaster_user -ppassword123 -e "DESCRIBE [table_name];" tripmaster`

2. CREATE BRANCH
   - Create a new branch for the task to ensure proper git management:
     `git checkout -b [feature/feature-name | fix/issue-description]`

3. PLAN
   - Update `task.md` with new items.
   - Update `implementation_plan.md` with proposed changes (Controllers, Beans, Database).

4. IMPLEMENT
   - Execute code changes.
   - If modifying Database Schema: Create/Run SQL scripts.
   - If modifying Beans: Ensure getters/setters are updated.

5. BUILD & DEPLOY
   // turbo
   - Run `./build_and_deploy.sh`
   - This script cleans, compiles, creates the WAR file, and deploys it to Tomcat automatically.

6. VERIFY
   - Agent: Check `catalina.out` (if accessible) or check DB state.
   - User: Verify UI functionality in the browser.
