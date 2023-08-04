module.exports = {
    onWillParseMarkdown: function(markdown) {
      return new Promise((resolve, reject)=> {
        // ::: success or tip :::
        markdown = markdown.replace(/:::[\s]*(success|tip)[\s\S]*?:::/gm, (success_alert) => {
          let classname = "tip";
          if(/:::[\s]*success[\s\S]*?:::/.test(success_alert))
            classname = "success";
          const first_pos = success_alert.indexOf('\n', 0)
          success_alert = `<div class="alert alert-${classname}">\n` + success_alert.slice(first_pos)
          success_alert = success_alert.slice(0, -3) + '</div>'
          return success_alert
        })
        // ::: info or note :::
        markdown = markdown.replace(/:::[\s]*(info|note)[\s\S]*?:::/gm, (info_alert) => {
          let classname = "note";
          if(/:::[\s]*info[\s\S]*?:::/.test(info_alert))
            classname = "info";
          const first_pos = info_alert.indexOf('\n', 0)
          info_alert = `<div class="alert alert-${classname}">\n` + info_alert.slice(first_pos)
          info_alert = info_alert.slice(0, -3) + '</div>'
          return info_alert
        })
        // ::: important :::
        markdown = markdown.replace(/:::[\s]*(important)[\s\S]*?:::/gm, (important_alert) => {
          let classname = "important";
          const first_pos = important_alert.indexOf('\n', 0)
          important_alert = `<div class="alert alert-${classname}">\n` + important_alert.slice(first_pos)
          important_alert = important_alert.slice(0, -3) + '</div>'
          return important_alert
        })
        // ::: restricted :::
        markdown = markdown.replace(/:::[\s]*(restricted)[\s\S]*?:::/gm, (restricted_alert) => {
          let classname = "restricted";
          const first_pos = restricted_alert.indexOf('\n', 0)
          restricted_alert = `<div class="alert alert-${classname}">\n` + restricted_alert.slice(first_pos)
          restricted_alert = restricted_alert.slice(0, -3) + '</div>'
          return restricted_alert
        })
        // ::: danger or warning :::
        markdown = markdown.replace(/:::[\s]*(danger|warning)[\s\S]*?:::/gm, (danger_alert) => {
          let classname = "danger";
          if(/:::[\s]*warning[\s\S]*?:::/.test(danger_alert))
            classname = "warning";
          const first_pos = danger_alert.indexOf('\n', 0)
          danger_alert = `<div class="alert alert-${classname}">\n` + danger_alert.slice(first_pos)
          danger_alert = danger_alert.slice(0, -3) + '</div>'
          return danger_alert
        })
        return resolve(markdown)
      })
    },
    onDidParseMarkdown: function(html, {cheerio}) {
      return new Promise((resolve, reject)=> {
        return resolve(html)
      })
    },
    onWillTransformMarkdown: function (markdown) {
      return new Promise((resolve, reject) => {
          return resolve(markdown);
      });
    },
    onDidTransformMarkdown: function (markdown) {
      return new Promise((resolve, reject) => {
          return resolve(markdown);
      });
    }
  }
