---
trigger: always_on
---

# Stitch Agent Rules & Guidelines

This document serves as the **SINGLE SOURCE OF TRUTH** for AI Agents (and human developers) when using the **Google Stitch Extension** via the Gemini CLI to design the front end of **ANY** project.

## 1. Golden Rules (CRITICAL)

### 🔴 Execution Flags
When running the `gemini` CLI for Stitch operations, you **MUST** use the following flags to prevent policy blocks:
```bash
gemini --approval-mode yolo --allowed-tools "*"
```
*Reason: The Stitch extension chains multiple tools (search -> generate -> write). Default policies will block these internal calls.*

### 🛠️ Technical Constraints (Dynamic)
Before generating any UI code, the Agent **MUST**:
1.  **Analyze Project Context**: Scan the current directory and subdirectories to identify the dominant file types (e.g., `.tsx`, `.vue`, `.php`, `.html`).
2.  **Identify Styling**: Check for configuration files (`tailwind.config.js`, `package.json`) or CSS imports to determine the styling framework (Tailwind, Bootstrap, CSS Modules, Styled Components, etc.).
3.  **Adhere to Detected Stack**: Generate code that aligns *exactly* with the detected architecture.
    *   *Examples:* If React is found, generate components. If PHP is found, allow for server-side tags.
4.  **Aesthetic Alignment**: Infer the design language from existing CSS files or project documentation/assets if available. Otherwise, ask the user for a theme.

---

## 2. Standard Workflow

### Phase 1: Context Gathering
Do not guess. Use `list_files` or `read_file` on key config files (like `package.json` or `composer.json`) to understand the environment.

### Phase 2: Generation
Use the `/stitch` command prefix. Be specific about constraints in your prompt based on your analysis.

**✅ Good Prompt Pattern:**
> /stitch Design a [COMPONENT_NAME] for this project. Adhere to [DETECTED_TECH_STACK] and [DETECTED_STYLING]. Save as '[FILENAME]'.

### Phase 3: Integration
Once the design is approved by the user:
1.  Adapt the generated code to fit the project's file structure (e.g., splitting into partials/components).
2.  Save it to the appropriate directory based on the project's conventions.

---

## 3. Troubleshooting

| Error | Cause | Fix |
| :--- | :--- | :--- |
| `Tool execution denied by policy` | Missing CLI flags. | Restart with `--approval-mode yolo`. |
| `401 Unauthorized` | Invalid API Key. | Check `~/.gemini/extensions/Stitch/gemini-extension.json`. Key must be the specific `AQ.` Stitch Auth key. |
| `File not saved` | Extension error. | Ask agent to print the code block to the console, then manually save it. |

---

## 4. API Key Configuration
The project uses a specialized **Stitch Auth API Key** (Format: `AQ....`).
This information is stored in the Gemini extension configuration file (`~/.gemini/extensions/Stitch/gemini-extension.json`).
