// TODO: Look into containers support for this: https://github.com/johnste/finicky/issues/211
module.exports = {
  defaultBrowser: "Firefox",
  options: {
    hideIcon: false, 
    checkForUpdate: true,
  },
  handlers: [
    {
      match: ({ url, urlString }) => {
        finicky.log("Received URL " + urlString);
        return url.host === "apple.com";
      },
      browser: "Safari"
    },
    {
      match: ({ opener }) => !opener.path && !opener.name && !opener.bundleId,
      browser: "Browserosaurus"
    },
    {
      // You can get the path of the process that triggered Finicky (EXPERIMENTAL)
      match: ({ opener }) => {
        return opener.path && (
          opener.path.startsWith("/Applications/iTerm.app") ||
          opener.path.startsWith("/Applications/Slack.app")
        )
      },
      browser: "Browserosaurus"
    },
    {
      // You can get the path of the process that triggered Finicky (EXPERIMENTAL)
      match: ({ opener }) => opener.path && opener.path.startsWith("/Applications/SketchUp"),
      browser: "Browserosaurus"
    },
  ]
};
