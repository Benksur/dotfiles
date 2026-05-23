// Dark cool grey — bar matches ghostty (#12141a @ ~85% opacity)
// Widget accents are solid greys (for widgetsBackgroundColorAsForeground)
const barA = 0.88;
const surfaceA = 0.6;

export const theme = {
  name: "Stone",
  kind: "dark",
  main: `rgba(18, 20, 26, ${barA})`,
  mainAlt: `rgba(22, 24, 30, ${barA})`,
  minor: `rgba(60, 64, 72, ${surfaceA})`,
  red: "#d4d8e0",
  green: "#bcc4ce",
  yellow: "#e8ebf0",
  orange: "#a8b0bc",
  blue: "#c5cad4",
  magenta: "#b8bec8",
  cyan: "#ccd2dc",
  black: "#0c0d10",
  white: "#8b939f",
  foreground: "#d8dce4",
  transparentDark: "rgba(0, 0, 0, 0.05)",
  defaultFont: "JetBrains Mono, Monaco, Menlo, monospace",
  barHeight: "34px",
  compactBarHeight: "28px",
  barRadius: "8px",
  barBorder: "0px solid transparent",
  barInnerMargin: "3px",
  itemRadius: "7px",
  itemInnerMargin: "2px 6px",
  itemOuterMargin: "0 0 0 5px",
  hoverRing: "0 0 0 2px rgba(255, 255, 255, 0.75)",
  focusRing: "0 0 0 2px rgb(255, 255, 255)",
  lightShadow: "0 5px 10px rgba(0, 0, 0, 0.24)",
  transitionEasing: "cubic-bezier(0.4, 0, 0.2, 1)",
  clickEffect: "rgba(255, 255, 255, 0.3)",
};
