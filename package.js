Package.describe({
  summary: "basic cms pages your clients can change at 'admin/cms'"
});

Package.on_use(function (api, where) {

  api.use([
    'templating',
    'handlebars',
    'less',
    'timeago',
    'showdown',
    'ace-embed'
  ], 'client');

  api.use([
    'coffeescript',
    'minimongoid',
    'underscore'
  ], ['client', 'server']);

  api.add_files([
    'client/views/comments/_cms.html',
    'client/views/comments/_cms.coffee',
    'client/views/comments/_cms.less',
    'client/router.coffee',
    'client/subscriptions.coffee'
  ], 'client');

  api.add_files([
    'server/publications.coffee'
  ], 'server');

  api.add_files([
    'collections/cms.coffee'
  ], ['client', 'server']);

  api.export('Cms', ['client', 'server'])
  
});