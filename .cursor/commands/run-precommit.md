# Run Precommit

**Command Name**: Run Precommit
**Short Description**: Runs precommit checks across all monorepo projects and automatically fixes any failing tests

## Instructions

Execute the following workflow to run precommit checks across all projects and fix any issues:

### 1. Run Precommit Across All Projects

```bash
cd ~/gitw/getfjell && kodrdriv tree --cmd "npm run precommit"
```

Run with full permissions to avoid sandbox issues.

### 2. Monitor for Failures

Watch the output carefully to identify:
- Which project failed (e.g., "lib", "api", etc.)
- What type of failure occurred (test failures, linting errors, build errors)
- Specific error messages and stack traces

### 3. Fix the Failing Project

For each failing project:
- Navigate to the project directory
- Analyze the error messages and stack traces
- Fix the issues in the source files:
  - **Test failures**: Fix the test logic or the source code being tested
  - **Linting errors**: Fix code style issues, imports, or type errors
  - **Build errors**: Resolve TypeScript compilation or bundling issues

### 4. Resume from the Failed Project

After fixing the issues, resume the precommit run from that project:

```bash
cd ~/gitw/getfjell && kodrdriv tree --cmd "npm run precommit" --start-from <failed-project>
```

For example, if the "lib" project failed:
```bash
cd ~/gitw/getfjell && kodrdriv tree --cmd "npm run precommit" --start-from lib
```

### 5. Repeat Until All Pass

Continue this cycle until all projects successfully complete their precommit checks:
1. Identify the next failing project
2. Fix the issues
3. Resume from that project
4. Monitor for the next failure

### 6. Report Results

Provide a summary including:
- Which projects failed initially
- What issues were fixed in each project
- Final status (all projects passing)
- Any remaining issues or warnings

## Common Issues and Solutions

**Test Failures:**
- Read the test file and understand what's being tested
- Check if the source code logic matches the test expectations
- Verify mock data and test fixtures are correct
- Update snapshots if the changes are intentional

**Linting Errors:**
- Fix TypeScript type errors
- Remove unused imports and variables
- Fix code formatting issues
- Add missing JSDoc comments if required

**Build Errors:**
- Resolve TypeScript compilation errors
- Fix import paths and module resolution
- Check for circular dependencies
- Ensure all required dependencies are available

**Integration Issues:**
- If a project fails due to changes in a dependency, fix the dependency first
- Remember projects are locally linked via `kodrdriv link`
- Never run `npm install` or `npm link` manually

## Best Practices

1. **Fix issues at the source** - Don't skip tests or ignore errors
2. **Test locally** - Run `npm run precommit` in individual projects to verify fixes
3. **Check dependencies** - If a shared library changed, dependent projects may need updates
4. **Iterate quickly** - Fix one project at a time and resume
5. **Preserve test intent** - Fix the code to match tests, not the other way around (unless tests are wrong)

## Environment Requirements

- Node.js >= 22.x
- All project dependencies installed
- Projects properly linked via `kodrdriv link`
- NODE_AUTH_TOKEN set for GitHub package access

## Related Documentation

- `@getfjell/.cursor/rules` - Monorepo structure and development workflow
- Individual project README.md files for project-specific guidance

