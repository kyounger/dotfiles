// TODO: Look into containers support for this: https://github.com/johnste/finicky/issues/211
// TODO: if sources is iTerm, always ask
module.exports = {
  defaultBrowser: "Brave Browser",
  options: {
    hideIcon: false, 
    checkForUpdate: true,
  },
  handlers: [
    {
      // You can get the path of the process that triggered Finicky (EXPERIMENTAL)
      match: ({ opener }) =>
        opener.path && opener.path.startsWith("/Applications/iTerm.app"),
      browser: "Browserosaurus"
    },
    {
      // You can get the path of the process that triggered Finicky (EXPERIMENTAL)
      match: ({ opener }) =>
        opener.path && opener.path.startsWith("/Applications/SketchUp 2022/SketchUp.app"),
      browser: "Browserosaurus"
    },
  ]
};
