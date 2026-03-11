---
name: material-ui
description: Material-UI (MUI) v7 React component library - components, theming, customization, best practices
metadata:
  language: typescript
  audience: developers
---

## Overview

Material-UI (MUI) v7 is the latest version of the popular React component library implementing Google's Material Design. Use this skill when working with MUI components.

**Current Version:** v7.3.9

## Installation

```bash
npm install @mui/material @emotion/react @emotion/styled
```

### Peer Dependencies

```json
{
  "peerDependencies": {
    "react": "^17.0.0 || ^18.0.0 || ^19.0.0",
    "react-dom": "^17.0.0 || ^18.0.0 || ^19.0.0"
  }
}
```

### Icons

```bash
npm install @mui/icons-material
```

### Roboto Font

```bash
npm install @fontsource/roboto
```

Import in entry point:
```tsx
import '@fontsource/roboto/300.css';
import '@fontsource/roboto/400.css';
import '@fontsource/roboto/500.css';
import '@fontsource/roboto/700.css';
```

### React 18 and Below

If using React 18 or below, set `react-is` override:
```json
{
  "overrides": {
    "react-is": "^18.3.1"
  }
}
```

## Quickstart

```tsx
import Button from '@mui/material/Button';

export default function App() {
  return <Button variant="contained">Hello World</Button>;
}
```

## Required Globals

Add to your app:
```tsx
import { CssBaseline, ThemeProvider } from '@mui/material';
```

Viewport meta tag:
```html
<meta name="viewport" content="initial-scale=1, width=device-width" />
```

## Theming

### Create Theme

```tsx
import { createTheme } from '@mui/material/styles';

const theme = createTheme({
  palette: {
    mode: 'dark',
    primary: { main: '#1976d2' },
    secondary: { main: '#dc004e' },
  },
  typography: {
    fontFamily: '"Roboto", "Helvetica", "Arial", sans-serif',
  },
  spacing: 8,
});
```

### Apply Theme

```tsx
import { ThemeProvider, CssBaseline } from '@mui/material';

function App({ children }) {
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      {children}
    </ThemeProvider>
  );
}
```

### Dark Mode with CSS Variables

```tsx
const theme = createTheme({
  cssVariables: {
    colorSchemeSelector: 'class',
  },
  colorSchemes: {
    light: true,
    dark: true,
  },
});
```

Use `theme.vars.*` for CSS variables:
```tsx
const StyledDiv = styled('div')(({ theme }) => ({
  color: theme.vars.palette.text.primary,
}));
```

### Color Scheme with useColorScheme

MUI v7 provides `useColorScheme` hook to manage color modes (light/dark/system) without explicit state management. Pair with a custom `useMode` hook for cleaner separation of concerns.

**1. Create the theme with color schemes:**
```tsx
import { createTheme } from '@mui/material/styles';

const theme = createTheme({
  cssVariables: {
    colorSchemeSelector: 'class',
  },
  colorSchemes: {
    light: true,
    dark: true,
  },
  palette: {
    primary: { main: '#1976d2' },
    secondary: { main: '#dc004e' },
  },
});
```

**2. Wrap your app with ThemeProvider:**
```tsx
import { ThemeProvider, CssBaseline } from '@mui/material';

function App() {
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <YourApp />
    </ThemeProvider>
  );
}
```

**3. Create a useMode hook for cleaner access:**
```tsx
// hooks/useMode.ts
import { useColorScheme } from '@mui/material/styles';

type Mode = 'light' | 'dark' | 'system';

export function useMode() {
  const { mode, setMode, systemMode } = useColorScheme();

  return {
    mode: mode === 'system' ? systemMode : mode,
    modeRaw: mode,
    setMode,
    isDark: (mode === 'system' ? systemMode : mode) === 'dark',
  };
}
```

**4. Use in your TopBar component:**
```tsx
import { AppBar, Toolbar, Typography, IconButton } from '@mui/material';
import { useMode } from './hooks/useMode';
import LightMode from '@mui/icons-material/LightMode';
import DarkMode from '@mui/icons-material/DarkMode';
import SettingsBrightness from '@mui/icons-material/SettingsBrightness';

function TopBar() {
  const { modeRaw, setMode } = useMode();

  const cycleMode = () => {
    const modes: Array<'light' | 'dark' | 'system'> = ['light', 'dark', 'system'];
    const currentIndex = modes.indexOf(modeRaw);
    setMode(modes[(currentIndex + 1) % modes.length]);
  };

  return (
    <AppBar position="static">
      <Toolbar>
        <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
          My App
        </Typography>
        <IconButton color="inherit" onClick={cycleMode}>
          {modeRaw === 'dark' ? <LightMode /> : modeRaw === 'light' ? <DarkMode /> : <SettingsBrightness />}
        </IconButton>
      </Toolbar>
    </AppBar>
  );
}
```

**5. Use in any component:**
```tsx
import { useMode } from './hooks/useMode';
import { Box, Typography } from '@mui/material';

function Dashboard() {
  const { isDark, mode } = useMode();

  return (
    <Box sx={{ bgcolor: isDark ? 'grey.900' : 'grey.100', p: 2 }}>
      <Typography>Current mode: {mode}</Typography>
    </Box>
  );
}
```

## Customization

### 1. One-off: sx Prop

```tsx
<Button sx={{ width: 300, bgcolor: 'success.main' }}>
  Custom
</Button>
```

### 2. Nested Styles

```tsx
<Slider sx={{ '& .MuiSlider-thumb': { borderRadius: 1 } }} />
```

### 3. Reusable: styled()

```tsx
import Slider, { SliderProps } from '@mui/material/Slider';
import { styled } from '@mui/material/styles';

const SuccessSlider = styled(Slider)<SliderProps>(({ theme }) => ({
  color: theme.palette.success.main,
}));
```

### 4. Dynamic Props

```tsx
interface CustomSliderProps extends SliderProps {
  success?: boolean;
}

const StyledSlider = styled(Slider, {
  shouldForwardProp: (prop) => prop !== 'success',
})<CustomSliderProps>(({ success, theme }) => ({
  ...(success && { color: theme.palette.success.main }),
}));
```

### 5. Global Theme Overrides

```tsx
const theme = createTheme({
  components: {
    MuiButton: {
      defaultProps: { disableElevation: true },
      styleOverrides: {
        root: { textTransform: 'none' },
      },
    },
  },
});
```

## Component Patterns

### Slot Props (MUI v7 Standard)

```tsx
<Accordion
  slots={{ transition: CustomTransition }}
  slotProps={{ transition: { unmountOnExit: true } }}
/>
```

### Responsive Design

```tsx
<Box sx={{
  display: 'flex',
  flexDirection: { xs: 'column', md: 'row' },
  gap: { xs: 1, md: 2 },
}} />
```

### Grid (v2 - now just Grid)

```tsx
import Grid from '@mui/material/Grid';

<Grid container spacing={2}>
  <Grid item xs={12} md={6}>Content</Grid>
</Grid>
```

### Stack (Preferred over Box for Simple Layouts)

```tsx
<Stack direction="row" spacing={2}>
  <Button>One</Button>
  <Button>Two</Button>
</Stack>
```

## State Classes

Use for hover, focus, disabled, selected states:
- `.Mui-active`, `.Mui-checked`, `.Mui-disabled`, `.Mui-error`, `.Mui-expanded`, `.Mui-focusVisible`, `.Mui-focused`, `.Mui-readOnly`, `.Mui-required`, `.Mui-selected`

```tsx
<Button disabled className="CustomButton">
// Style: .CustomButton.Mui-disabled { ... }
```

## Migration to v7

### Key Changes

1. **Grid2 → Grid**: Use `import Grid from '@mui/material/Grid'`
2. **Lab components**: Import from `@mui/material` not `@mui/lab`
3. **createMuiTheme → createTheme**
4. **InputLabel size="normal" → size="medium"**
5. **Deep imports removed**: Use `import { createTheme } from '@mui/material/styles'`
6. **Hidden component removed**: Use `sx` prop or `useMediaQuery`

### Codemods

```bash
npx @mui/codemod v7.0.0/grid-props <path>
npx @mui/codemod v7.0.0/lab-removed-components <path>
npx @mui/codemod v7.0.0/input-label-size-normal-medium <path>
```

## Icons

Import individually for tree-shaking:
```tsx
import Home from '@mui/icons-material/Home';
import Search from '@mui/icons-material/Search';
```

Use `sx` for sizing:
```tsx
<Home sx={{ fontSize: 24, color: 'primary.main' }} />
```

## Common Components

| Component | Use Case |
|-----------|----------|
| Box | Generic wrapper |
| Container | Page layout |
| Stack | Simple layouts |
| Grid | Complex layouts |
| Button | Actions |
| TextField | Form inputs |
| Card | Content containers |
| AppBar | Navigation headers |
| Drawer | Side navigation |
| Dialog | Modals |
| Table | Data grids |
| Chip | Tags/labels |
| Typography | Text styling |
| Avatar | User images |
| Alert | Notifications |
| Skeleton | Loading states |
| Menu | Dropdown menus |
| Tabs | Tab navigation |
| Stepper | Multi-step forms |

## Best Practices

1. **Use Theme** - Define colors, typography, spacing globally
2. **Use sx for One-off** - Quick style overrides
3. **Use styled() for Reusable** - Create custom components
4. **Use Stack** - Prefer over Box for simple layouts
5. **Use Grid (v2)** - For complex responsive layouts
6. **Use CSS Variables** - For better dev tools and dark mode
7. **Use Slot Props** - MUI v7 standard for component customization
8. **TypeScript** - MUI v7 requires TypeScript 4.9+
9. **Test** - Use `@mui/internal/test-utils` for testing
10. **Top Bar with Color Scheme Switch** - Use AppBar with Toolbar, Typography for title, and useColorScheme hook for theme toggle

```tsx
import { AppBar, Toolbar, Typography, IconButton } from '@mui/material';
import { useColorScheme } from '@mui/material/styles';
import LightMode from '@mui/icons-material/LightMode';
import DarkMode from '@mui/icons-material/DarkMode';

function TopBar() {
  const { mode, setMode } = useColorScheme();

  return (
    <AppBar position="static">
      <Toolbar>
        <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
          My App
        </Typography>
        <IconButton color="inherit" onClick={() => setMode(mode === 'dark' ? 'light' : 'dark')}>
          {mode === 'dark' ? <LightMode /> : <DarkMode />}
        </IconButton>
      </Toolbar>
    </AppBar>
  );
}
```
