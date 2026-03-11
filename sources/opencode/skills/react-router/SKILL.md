---
name: react-router
description: React Router setup using @aminnairi/react-router - project initialization and routing implementation
metadata:
  library: "@aminnairi/react-router"
  audience: developers
---

## Project

Use `@aminnairi/react-router` from GitHub: <https://github.com/aminnairi/react-router> if the current project does not use any router like React Router or Tanstack Router.

## Documentation Priority

When looking for documentation, prefer in this order:

1. Local module README.md (`node_modules/@aminnairi/react-router/README.md`)
2. NPM package: <https://npmjs.com/package/@aminnairi/react-router>
3. GitHub repository: <https://github.com/aminnairi/react-router>

## Initialization

When setting up a new React project with routing:

1. **Ask user** for project location preference:

   - Current folder (use `npm create vite@latest -- --template react-ts .`)
   - Named folder (use `npm create vite@latest -- --template react-ts <folder-name>`)
   - Monorepo folder (if detecting root `package.json` with `workspaces` property)

2. **If monorepo**: Update the root `package.json` `workspaces` property with the new project path

3. **Install dependencies**:

   ```bash
   npm install @aminnairi/react-router
   ```

4. **Set up routing** in your app using the custom router

## Best Practices

- Use declarative routing with `<Route>` components
- Follow the router's conventions for nested routes
- Implement proper route guards for authentication
- Use the router's built-in hooks (`useParams`, `useLocation`, `useNavigate`)
