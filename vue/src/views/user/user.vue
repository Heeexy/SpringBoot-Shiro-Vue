<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-form-item>
          <el-button type="primary" icon="plus" v-permission="'user:add'" @click="showCreate">添加
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-table :data="list" v-loading="listLoading"  border fit
              highlight-current-row>
      <el-table-column align="center" label="序号" width="80">
        <template slot-scope="scope">
          <span v-text="getIndex(scope.$index)"> </span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="昵称" prop="nickname" style="width: 60px;"></el-table-column>
      <el-table-column align="center" label="用户名" prop="username" style="width: 60px;"></el-table-column>
      <el-table-column align="center" label="角色" width="200">
        <template slot-scope="scope">
          <div style="margin-right: 4px;display: inline-block" v-for="i in scope.row.roles">
            <el-tag type="success" v-text="i.roleName" v-if="i.roleId===1"></el-tag>
            <el-tag type="primary" v-text="i.roleName" v-else></el-tag>
          </div>
        </template>
      </el-table-column>
      <el-table-column align="center" label="创建时间" prop="createTime" width="170"></el-table-column>
      <el-table-column align="center" label="最近修改时间" prop="updateTime" width="170"></el-table-column>
      <el-table-column align="center" label="管理" width="220" >
        <template slot-scope="scope">
          <el-button type="primary" icon="edit" @click="showUpdate(scope.$index)" v-permission="'user:update'">修改</el-button>
          <el-button type="danger" icon="delete" v-if="scope.row.userId!==userId "
                     @click="removeUser(scope.$index)" v-permission="'user:update'">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="listQuery.pageNum"
      :page-size="listQuery.pageRow"
      :total="totalCount"
      :page-sizes="[10, 20, 50, 100]"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form class="small-space" :model="tempUser" label-position="left" label-width="80px"
               style='width: 300px; margin-left:50px;'>
        <el-form-item label="用户名" required v-if="dialogStatus==='create'">
          <el-input type="text" v-model="tempUser.username">
          </el-input>
        </el-form-item>
        <el-form-item label="密码" v-if="dialogStatus==='create'" required>
          <el-input type="password" v-model="tempUser.password">
          </el-input>
        </el-form-item>
        <el-form-item label="新密码" v-else>
          <el-input type="password" v-model="tempUser.password" placeholder="不填则表示不修改">
          </el-input>
        </el-form-item>
        <el-form-item label="角色" required>
          <el-select v-model="tempUser.roleIds" multiple placeholder="支持多角色" style="width: 300px">
            <el-option
              v-for="item in roles"
              :key="item.roleId"
              :label="item.roleName"
              :value="item.roleId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="昵称" required>
          <el-input type="text" v-model="tempUser.nickname">
          </el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button v-if="dialogStatus==='create'" type="success" @click="createUser">创 建</el-button>
        <el-button type="primary" v-else @click="updateUser">修 改</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import {mapGetters} from 'vuex'

export default {
  data() {
    return {
      totalCount: 0, //分页组件--数据总条数
      list: [],//表格的数据
      listLoading: false,//数据加载等待动画
      listQuery: {
        pageNum: 1,//页码
        pageRow: 50,//每页条数
      },
      roles: [],//角色列表
      dialogStatus: 'create',
      dialogFormVisible: false,
      textMap: {
        update: '编辑',
        create: '新建用户'
      },
      tempUser: {
        username: '',
        password: '',
        nickname: '',
        roleIds: [],
        userId: ''
      }
    }
  },
  created() {
    this.getList();
    if (this.hasPerm('user:add') || this.hasPerm('user:update')) {
      this.getAllRoles();
    }
  },
  computed: {
    ...mapGetters([
      'userId'
    ])
  },
  methods: {
    getAllRoles() {
      this.api({
        url: "/user/getAllRoles",
        method: "get"
      }).then(data => {
        this.roles = data.list;
      })
    },
    getList() {
      //查询列表
      this.listLoading = true;
      this.api({
        url: "/user/list",
        method: "get",
        params: this.listQuery
      }).then(data => {
        this.listLoading = false;
        this.list = data.list;
        this.totalCount = data.totalCount;
      })
    },
    handleSizeChange(val) {
      //改变每页数量
      this.listQuery.pageRow = val
      this.handleFilter();
    },
    handleCurrentChange(val) {
      //改变页码
      this.listQuery.pageNum = val
      this.getList();
    },
    handleFilter() {
      //查询事件
      this.listQuery.pageNum = 1
      this.getList()
    },
    getIndex($index) {
      //表格序号
      return (this.listQuery.pageNum - 1) * this.listQuery.pageRow + $index + 1
    },
    showCreate() {
      //显示新增对话框
      this.tempUser.username = "";
      this.tempUser.password = "";
      this.tempUser.nickname = "";
      this.tempUser.roleIds = [];
      this.tempUser.userId = "";
      this.dialogStatus = "create"
      this.dialogFormVisible = true
    },
    showUpdate($index) {
      let user = this.list[$index];
      this.tempUser.username = user.username;
      this.tempUser.nickname = user.nickname;
      this.tempUser.roleIds = user.roles.map(x => x.roleId);
      this.tempUser.userId = user.userId;
      this.tempUser.deleteStatus = '1';
      this.tempUser.password = '';
      this.dialogStatus = "update"
      this.dialogFormVisible = true
    },
    validate(isCreate) {
      let u = this.tempUser
      if (isCreate && u.username.trim().length === 0) {
        this.$message.warning('请填写用户名')
        return false
      }
      if (isCreate && u.password.length === 0) {
        this.$message.warning('请填写密码')
        return false
      }
      if (u.nickname.trim().length === 0) {
        this.$message.warning('请填写昵称')
        return false
      }
      if (u.roleIds.length === 0) {
        this.$message.warning('请选择角色')
        return false
      }
      return true
    },
    createUser() {
      if (!this.validate(true)) return
      //添加新用户
      this.api({
        url: "/user/addUser",
        method: "post",
        data: this.tempUser
      }).then(() => {
        this.$message.success('添加成功')
        this.getList();
        this.dialogFormVisible = false
      })
    },
    updateUser() {
      if (!this.validate(false)) return
      //修改用户信息
      let _vue = this;
      this.api({
        url: "/user/updateUser",
        method: "post",
        data: this.tempUser
      }).then(() => {
        this.$message.success('修改成功')
        this.dialogFormVisible = false
        _vue.getList();

      })
    },
    removeUser($index) {
      let _vue = this;
      this.$confirm('确定删除此用户?', '提示', {
        confirmButtonText: '确定',
        showCancelButton: false,
        type: 'warning'
      }).then(() => {
        let user = _vue.list[$index];
        user.deleteStatus = '2';
        user.roleIds = user.roles.map(x => x.roleId)
        _vue.api({
          url: "/user/updateUser",
          method: "post",
          data: user
        }).then(() => {
          this.$message.success('删除成功')
          _vue.getList()
        }).catch(() => {
          _vue.$message.error("删除失败")
        })
      })
    },
  }
}
</script>
