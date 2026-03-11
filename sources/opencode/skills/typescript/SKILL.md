---
name: typescript
description: TypeScript development guidelines - strict config, functional programming, best practices
metadata:
  language: typescript
  audience: developers
---

## Configuration

When working in a TypeScript project:

1. **Check for tsconfig.json** - Always verify the project has a `tsconfig.json`
2. **If missing**: Install `typescript` as dev dependency, then run `npx tsc --init`
3. **Use strictest options** - Configure the strictest possible compilerOptions:
   - `strict: true`
   - `noUncheckedIndexedAccess: true`
   - `noImplicitReturns: true`
   - `noFallthroughCasesInSwitch: true`
   - `exactOptionalPropertyTypes: true`
   - `noImplicitOverride: true`

Reference: https://www.typescriptlang.org/tsconfig/

## Functional Programming

Favor functional programming when coding in TypeScript:

- **Immutability** - Use `const`, spread operators, `Object.freeze()`, immutable data structures
- **Pure functions** - Same input always produces same output, no side effects
- **No side-effects** - Prefer pure functions, isolate side effects to specific layers
- **No throw** - Use Result/Either types for error handling instead of exceptions

## Type Safety

- Prefer `type` over `interface` for unions and primitives
- Use `unknown` over `any` - always narrow types before use
- Enable `strictNullChecks` - handle null/undefined explicitly
- Use utility types (`Partial`, `Required`, `Readonly`, `Record`, etc.)
- Avoid `as` assertions; prefer type guards
