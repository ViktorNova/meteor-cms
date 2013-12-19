Router.map ->

  @route 'cmsAdmin',
    path: '/admin/cms'
    waitOn: ->
      [ Meteor.subscribe 'cms' ]
    before: ->
      if Meteor.loggingIn()
        return @stop()

      if not Meteor.user()
        return @redirect('/')

  @route 'cmsAdminNew',
    path: '/admin/cms/new'
    before: ->
      if Meteor.loggingIn()
        return @stop()

      if not Meteor.user()
        return @redirect('/')

  @route 'cmsAdminEdit',
    path: '/admin/cms/edit/:slug'
    waitOn: ->
      [ Meteor.subscribe 'cms' ]
    data: ->
      Cms.first slug: @params.slug
    before: ->
      if Meteor.loggingIn()
        return @stop()

      if not Meteor.user()
        return @redirect('/')

      Session.set 'cmsSlug', @params.slug

  @route 'cmsShow',
    path: 'admin/cms/view/:slug'
    notFoundTemplate: 'cmsNotFound'
    before: ->
      if Cms.settings.cmsShowTemplate
        @template = Cms.settings.cmsShowTemplate
      Session.set 'cmsSlug', @params.slug
    waitOn: ->
      [ Meteor.subscribe 'cms']
    data: ->
      Cms.first slug: @params.slug