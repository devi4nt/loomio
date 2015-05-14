angular.module('loomioApp').directive 'navbar', ->
  scope: {}
  restrict: 'E'
  templateUrl: 'generated/components/navbar/navbar.html'
  replace: true
  controller: ($scope, $rootScope, Records, ThreadQueryService) ->
    $scope.$on 'currentComponent', (el, component) ->
      $scope.selected = component

    $scope.unreadThreadCount = ->
      ThreadQueryService.unreadQuery().length()

    $scope.homePageClicked = ->
      $rootScope.$broadcast 'homePageClicked'

    if !$scope.inboxLoaded
      Records.discussions.fetchInbox().then ->
        $scope.inboxLoaded = true
