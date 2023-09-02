app.controller("category-ctrl", function($scope, $http) {
    $scope.items = [];
    $scope.form = {};
    $scope.cates = [];

    $scope.initialize = function() {
            //load categories
        $http.get(url + "/rest/categories").then(resp => {
            $scope.items = resp.data;
        })
    }

    //Xoá form
    $scope.reset = function() {
        $scope.form = {
            id: '',
            name: '',
        }
    }

    //Hiển thị lên form
    $scope.edit = function(item) {
		$scope.showToast('warning','Edit category '+$scope.form.id);
        $scope.form = angular.copy(item);
    }

    //Thêm sản phẩm
    $scope.create = function() {
        var item = angular.copy($scope.form);
        $http.post(url + '/rest/categories', item).then(resp => {
            $scope.items.push(resp.data);
            $scope.reset();
            $scope.showToast('success','Add new category successful '+item.id);
            console.log(resp.data);
        }).catch(err => {
            $scope.showToast('danger','Add new category failed '+item.id);
            console.log("Error ", err);
        })
    }

    //Update sản phẩm
    $scope.update = function() {
        var item = angular.copy($scope.form);
        $http.put(url + '/rest/categories/' + item.id, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.showToast('info','Update category successful '+item.id);
            console.log(resp.data);
        }).catch(err => {
            $scope.showToast('danger','Update new category failed '+item.id);
            console.log("Error ", err);
        })
    }

    //Remove sản phẩm
    $scope.delete = function(item) {
        $http.delete(url + `/rest/categories/${item.id}`).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            $scope.showToast('dark','Delete category successful '+item.id);
            console.log(resp.data);
        }).catch(err => {
            $scope.showToast('danger','Delete category failed '+item.id);
            console.log("Error ", err);
        })
    }

    $scope.pager = {
        page: 0,
        size: 10,
        get items() {
            var start = this.page * this.size;
            return $scope.items.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1.0 * $scope.items.length / this.size);
        },
        first() {
            this.page = 0;
        },
        previous() {
            this.page--;
            if (this.page < 0) {
                this.last();
            };
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            };
        },
        last() {
            this.page = this.count - 1;
        },
    }

    //Khởi đầu
    $scope.initialize();
    $scope.reset();
})