app = angular.module('Hpstrly', ['ngResource'])

# Configure app to allow form submissions
# without Rails form helpers
app.config ($routeProvider, $httpProvider) ->
  $httpProvider.defaults.headers.common["X-CSRF-Token"] = $("meta[name=csrf-token]").attr("content")

# Url Controller
@UrlCtrl = ($scope, $resource) ->
  Url = $resource('/urls/:id')
  $scope.urls = Url.query()
  $scope.addUrl = ->
    url = Url.save($scope.newUrl)
    $scope.urls.push(url)
    $scope.newUrl = {}
