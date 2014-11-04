videos = angular.module('movies', [])

videos.controller('MoviesController', ['$scope', '$http', ($scope, $http) ->
  $scope.movies = []

  $http.get('/movies').success (data) ->
      $scope.movies = data

  $scope.addMovie = (movie) ->
    $http.post('/movies', {movie : movie}).success (data) ->
      $scope.movies = data
      $scope.movie = ''

  $scope.deleteMovie = (movie) ->
    $http.delete("/movies/#{movie.id}").success (data) ->
      $scope.movies = data
])