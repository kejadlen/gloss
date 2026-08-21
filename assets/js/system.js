// Behavior for the pieces of the system that need it. Everything else is
// CSS and semantic HTML on purpose — a design system that only works with
// JavaScript running is a component library with extra steps.
(function () {
  "use strict";

  var STORAGE_KEY = "ad-theme";

  function readStored() {
    try {
      return localStorage.getItem(STORAGE_KEY);
    } catch (error) {
      return null;
    }
  }

  function writeStored(value) {
    try {
      localStorage.setItem(STORAGE_KEY, value);
    } catch (error) {
      /* Nothing to do — the media query still gives a sensible default. */
    }
  }

  function systemPrefersDark() {
    return window.matchMedia("(prefers-color-scheme: dark)").matches;
  }

  function currentTheme() {
    var explicit = document.documentElement.getAttribute("data-theme");
    if (explicit) return explicit;
    return systemPrefersDark() ? "dark" : "light";
  }

  function paintToggle(theme) {
    document.querySelectorAll("[data-theme-toggle]").forEach(function (toggle) {
      var next = theme === "dark" ? "light" : "dark";
      toggle.querySelectorAll("[data-theme-icon]").forEach(function (icon) {
        icon.hidden = icon.dataset.themeIcon !== theme;
      });
      toggle.setAttribute("aria-label", "Switch to the " + next + " theme");
      toggle.setAttribute("title", "Switch to the " + next + " theme");
      var label = toggle.querySelector("[data-theme-label]");
      if (label) label.textContent = "Switch to the " + next + " theme";
    });
  }

  function setUpTheme() {
    paintToggle(currentTheme());

    document.addEventListener("click", function (event) {
      var toggle = event.target.closest("[data-theme-toggle]");
      if (!toggle) return;

      var next = currentTheme() === "dark" ? "light" : "dark";
      document.documentElement.setAttribute("data-theme", next);
      writeStored(next);
      paintToggle(next);
    });

    // Follow the OS while the reader has not made an explicit choice.
    window.matchMedia("(prefers-color-scheme: dark)").addEventListener("change", function () {
      if (!readStored()) paintToggle(currentTheme());
    });
  }

  // Tabs, wired to the WAI-ARIA authoring practices: arrows move, Home/End
  // jump, and only the selected tab stays in the tab order.
  function setUpTabs() {
    document.querySelectorAll("[data-tabs]").forEach(function (root) {
      var tabs = Array.prototype.slice.call(root.querySelectorAll('[role="tab"]'));
      if (!tabs.length) return;

      function select(tab, focus) {
        tabs.forEach(function (candidate) {
          var selected = candidate === tab;
          candidate.setAttribute("aria-selected", String(selected));
          candidate.tabIndex = selected ? 0 : -1;
          var panel = document.getElementById(candidate.getAttribute("aria-controls"));
          if (panel) panel.hidden = !selected;
        });
        if (focus) tab.focus();
      }

      root.addEventListener("click", function (event) {
        var tab = event.target.closest('[role="tab"]');
        if (tab) select(tab, false);
      });

      root.addEventListener("keydown", function (event) {
        var index = tabs.indexOf(document.activeElement);
        if (index === -1) return;

        var next = null;
        if (event.key === "ArrowRight") next = tabs[(index + 1) % tabs.length];
        else if (event.key === "ArrowLeft") next = tabs[(index - 1 + tabs.length) % tabs.length];
        else if (event.key === "Home") next = tabs[0];
        else if (event.key === "End") next = tabs[tabs.length - 1];

        if (next) {
          event.preventDefault();
          select(next, true);
        }
      });

      select(tabs.filter(function (tab) {
        return tab.getAttribute("aria-selected") === "true";
      })[0] || tabs[0], false);
    });
  }

  function setUpNavToggle() {
    document.addEventListener("click", function (event) {
      var toggle = event.target.closest("[data-nav-toggle]");
      if (!toggle) return;

      var sidebar = toggle.closest("[data-sidebar]");
      var collapsed = sidebar.dataset.collapsed !== "false";
      sidebar.dataset.collapsed = String(!collapsed);
      toggle.setAttribute("aria-expanded", String(collapsed));
    });
  }

  // Demo-only: the buttons page shows a loading state that resolves itself.
  function setUpLoadingDemo() {
    document.addEventListener("click", function (event) {
      var button = event.target.closest("[data-demo-loading]");
      if (!button || button.dataset.loading === "true") return;

      button.dataset.loading = "true";
      window.setTimeout(function () {
        button.dataset.loading = "false";
      }, 1800);
    });
  }

  setUpTheme();
  setUpTabs();
  setUpNavToggle();
  setUpLoadingDemo();
})();
