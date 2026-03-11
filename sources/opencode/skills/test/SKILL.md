---
name: test
description: Vitest testing framework - unit tests, mocking, best practices
metadata:
  language: typescript
  audience: developers
---

## Overview

Vitest is a next-generation testing framework powered by Vite. Use this skill when writing tests, preferring Vitest over other testing frameworks.

**Current Version:** v4.x

## Installation

```bash
npm install -D vitest
```

Requires Vite >=v6.0.0 and Node >=v20.0.0

## Quickstart

### Basic Test

```typescript
// sum.ts
export function sum(a: number, b: number) {
  return a + b
}

// sum.test.ts
import { expect, test } from 'vitest'
import { sum } from './sum'

test('adds 1 + 2 to equal 3', () => {
  expect(sum(1, 2)).toBe(3)
})
```

### Run Tests

```bash
npm test        # watch mode
npm run test -- --run  # run once
```

## Configuration

### vitest.config.ts

```typescript
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    globals: true,           // Use vi globally
    environment: 'node',      // or 'happy-dom', 'jsdom', 'browser'
    include: ['**/*.{test,spec}.{js,mjs,cjs,ts,mts,cts,jsx,tsx}'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
    },
  },
})
```

### With Vite Project

Add to `vite.config.ts`:

```typescript
/// <reference types="vitest/config" />
import { defineConfig } from 'vite'

export default defineConfig({
  test: {
    globals: true,
    environment: 'happy-dom',
  },
})
```

## Test Functions

### describe - Test Suites

```typescript
import { describe, it, expect } from 'vitest'

describe('math utils', () => {
  it('should add numbers', () => {
    expect(1 + 2).toBe(3)
  })

  it('should subtract numbers', () => {
    expect(5 - 3).toBe(2)
  })
})
```

### test - Individual Tests

```typescript
import { test, expect } from 'vitest'

test('example', () => {
  expect(true).toBe(true)
})
```

### it - Alias for test

```typescript
import { it, expect } from 'vitest'

it('works the same as test', () => {
  expect(1).toBe(1)
})
```

## Expect Matchers

### Common Matchers

```typescript
expect(value).toBe(3)                    // ===
expect(value).toEqual({ a: 1 })          // deep equality
expect(value).toBeNull()                 // null
expect(value).toBeUndefined()            // undefined
expect(value).toBeTruthy()              // truthy
expect(value).toBeFalsy()                // falsy
expect(value).toContain(item)            // array/string contains
expect(value).toHaveLength(3)            // array length
expect(value).toHaveProperty('key')      // object property
expect(value).toThrow()                  // function throws
expect(value).toMatch(/regex/)           // regex match
expect(value).toMatchObject({ a: 1 })    // partial object match
```

### Type Testing

```typescript
import { expectTypeOf } from 'vitest'

expectTypeOf(value).toBeNumber()
expectTypeOf(value).toBeString()
expectTypeOf(value).toBeBoolean()
expectTypeOf(value).toEqualTypeOf<Expected>()
```

## Mocking

### vi.fn - Mock Functions

```typescript
import { vi, expect, test } from 'vitest'

const mockFn = vi.fn()
mockFn() // returns undefined

const mockWithReturn = vi.fn(() => 'mocked')
mockWithReturn() // returns 'mocked'

const mockWithImpl = vi.fn((x: number) => x * 2)
mockWithImpl(5) // returns 10
```

### vi.mock - Mock Modules

```typescript
// Note: vi.mock is hoisted to top of file
import { vi } from 'vitest'

vi.mock('./api', () => ({
  fetchUser: vi.fn(() => Promise.resolve({ id: 1, name: 'John' }))
}))

import { fetchUser } from './api'

test('fetches user', async () => {
  const user = await fetchUser()
  expect(user.name).toBe('John')
})
```

### vi.spyOn - Spy on Objects

```typescript
import { vi, expect, test } from 'vitest'

const obj = { method: () => 'original' }

test('spies on method', () => {
  const spy = vi.spyOn(obj, 'method')
  
  obj.method()
  
  expect(spy).toHaveBeenCalled()
  expect(spy).toHaveBeenCalledTimes(1)
})
```

### Mocking Dates

```typescript
import { vi, expect, test } from 'vitest'

test('mocked date', () => {
  const date = new Date('2022-01-01')
  vi.setSystemTime(date)
  
  expect(new Date().getFullYear()).toBe(2022)
  
  vi.useRealTimers()
})
```

### Mocking Timers

```typescript
import { vi, expect, test, fn } from 'vitest'

test('mock timers', async () => {
  vi.useFakeTimers()
  
  const callback = fn()
  setTimeout(callback, 1000)
  
  vi.runAllTimers()
  
  expect(callback).toHaveBeenCalled()
  
  vi.useRealTimers()
})
```

### Mocking Globals

```typescript
import { vi, expect, test } from 'vitest'

test('stub global', () => {
  vi.stubGlobal('__VERSION__', '1.0.0')
  expect(__VERSION__).toBe('1.0.0')
})
```

### Mock import.meta.env

```typescript
import { vi, expect, test } from 'vitest'

test('mock env', () => {
  vi.stubEnv('VITE_API_URL', 'https://mocked.com')
  expect(import.meta.env.VITE_API_URL).toBe('https://mocked.com')
})
```

## Setup Files

### Global Setup

```typescript
// setup.ts
import { beforeEach, vi } from 'vitest'

beforeEach(() => {
  vi.clearAllMocks()
  vi.resetAllMocks()
})
```

```typescript
// vitest.config.ts
export default defineConfig({
  test: {
    setupFiles: ['./setup.ts'],
  },
})
```

## Test Context

```typescript
import { test, expect } from 'vitest'

test('use test context', ({ task }) => {
  console.log(task.name)    // Test name
  console.log(task.id)       // Unique ID
})
```

## Async Testing

### Async/Await

```typescript
import { test, expect, vi } from 'vitest'

test('async function', async () => {
  const result = await asyncFunction()
  expect(result).toBe('expected')
})
```

### Resolves/Rejects

```typescript
test('async resolves', async () => {
  await expect(Promise.resolve('ok')).resolves.toBe('ok')
})

test('async rejects', async () => {
  await expect(Promise.reject(new Error('err'))).rejects.toThrow('err')
})
```

## Hooks

```typescript
import { beforeAll, beforeEach, afterAll, afterEach, describe, it } from 'vitest'

beforeAll(() => {
  // Runs once before all tests
})

beforeEach(() => {
  // Runs before each test
})

afterEach(() => {
  // Runs after each test
})

afterAll(() => {
  // Runs once after all tests
})
```

## Testing Types

```typescript
import { expectTypeOf } from 'vitest'
import { assertType } from 'vitest'

expectTypeOf(add).parameters.toEqualTypeOf<[number, number]>()
expectTypeOf(add).returns.toEqualTypeOf<number>()

assertType<number>(add(1, 2))
```

## Snapshot Testing

```typescript
import { expect, test } from 'vitest'

test('snapshot', () => {
  const result = { foo: 'bar' }
  expect(result).toMatchSnapshot()
})

test('inline snapshot', () => {
  expect('hello world').toMatchInlineSnapshot()
})
```

## Coverage

```bash
npm run test -- --coverage
```

```typescript
// vitest.config.ts
export default defineConfig({
  test: {
    coverage: {
      provider: 'v8', // or 'babel'
      reporter: ['text', 'html', 'json'],
      include: ['src/**/*.ts'],
      exclude: ['src/**/*.test.ts'],
    },
  },
})
```

## CLI Commands

```bash
vitest run            # Run once
vitest watch          # Watch mode (default)
vitest --ui           # UI mode
vitest --coverage     # With coverage
vitest related file   # Run tests related to file
vitest --grep "test"  # Run tests matching pattern
```

## Best Practices

1. **Use descriptive test names** - Should describe the expected behavior
2. **Follow AAA pattern** - Arrange, Act, Assert
3. **Test one thing per test** - Each test should verify one behavior
4. **Use describe blocks** - Group related tests
5. **Clear mocks after each test** - Use `beforeEach` with `vi.clearAllMocks()`
6. **Prefer fake timers** - For testing time-dependent code
7. **Use TypeScript** - For better type safety in tests
8. **Keep tests fast** - Aim for <100ms per test
9. **Use `vi.fn()` for mocks** - Over inline implementations
10. **Mock external dependencies** - APIs, databases, file system
11. **Aim for 100% code coverage** - Write tests to cover all branches, statements, and functions whenever possible
