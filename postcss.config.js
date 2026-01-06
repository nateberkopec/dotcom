const purgecss = require("@fullhuman/postcss-purgecss").default;

const isProduction = process.env.JEKYLL_ENV === "production";

module.exports = {
  plugins: [
    isProduction &&
      purgecss({
        content: [
          "./_site/**/*.html",
          "./_layouts/**/*.html",
          "./_includes/**/*.html",
          "./_posts/**/*.{md,markdown}",
          "./blog/**/*.{md,markdown}",
          "./*.html",
        ],
        defaultExtractor: (content) =>
          content.match(/[\w-/:]+(?<!:)/g) || [],
        safelist: {
          standard: [
            "*",
            "*:before",
            "*:after",
            "*::before",
            "*::after",
            "html",
            "body",
          ],
        },
      }),
  ].filter(Boolean),
};
