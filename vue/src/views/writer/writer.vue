<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-form-item>
          <el-input @keyup.enter.native="handleFilter" style="width: 200px;" placeholder="作家名称"
                    v-model="listQuery.name">
          </el-input>
          <el-button type="primary" icon="search" @click="handleFilter()">搜索</el-button>
          <el-button type="primary" icon="plus" @click="showCreate" v-if="hasPerm('writer:add')">添加
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-table :data="list" v-loading.body="listLoading" element-loading-text="拼命加载中" border fit
              highlight-current-row>
      <el-table-column align="center" label="序号" width="80">
        <template scope="scope">
          <span v-text="getIndex(scope.$index)"> </span>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="writerName" label="作家" style="width: 60px;"></el-table-column>
      <el-table-column align="center" label="创建时间" width="170">
        <template scope="scope">
          <span>{{scope.row.createTime}}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="管理" width="200" v-if="hasPerm('writer:update')">
        <template scope="scope">
          <el-button type="primary" icon="edit" @click="showUpdate(scope.$index)">修改</el-button>
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
      <el-form class="small-space" :model="tempWriter" label-position="left" label-width="60px"
               style='width: 300px; margin-left:50px;'>
        <el-form-item label="名称">
          <el-input type="text" v-model="tempWriter.writerName">
          </el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button v-if="dialogStatus=='create'" type="success" @click="createWriter">创 建</el-button>
        <el-button type="primary" v-else @click="updateWriter">修 改</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        totalCount: 0, //分页组件--数据总条数
        list: [],//表格的数据
        listLoading: false,//数据加载等待动画
        listQuery: {
          pageNum: 1,//页码
          pageRow: 10,//每页条数
          name: ''
        },
        dialogStatus: 'create',
        dialogFormVisible: false,
        textMap: {
          update: '编辑',
          create: '创建作家'
        },
        tempWriter: {
          writerName: "",
          writerId: ""
        }
      }
    },
    created() {
      this.getList();
    },
    methods: {
      getList() {
        //查询列表
        if (!this.hasPerm('writer:list')) {
          return
        }
        this.listLoading = true;
        this.api({
          url: "/writer/listWriter",
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
        this.tempWriter.writerId = "";
        this.tempWriter.writerName = "";
        this.dialogStatus = "create"
        this.dialogFormVisible = true
      },
      showUpdate($index) {
        //显示新增对话框
        this.tempWriter.writerId = this.list[$index].writerId;
        this.tempWriter.writerName = this.list[$index].writerName;
        this.dialogStatus = "update"
        this.dialogFormVisible = true
      },
      createWriter() {
        //保存新作家
        this.api({
          url: "/writer/addWriter",
          method: "post",
          data: this.tempWriter
        }).then(data => {
          this.getList();
          this.dialogFormVisible = false
        })
      },
      updateWriter() {
        //修改作家
        this.api({
          url: "/writer/updateWriter",
          method: "post",
          data: this.tempWriter
        }).then(data => {
          this.getList();
          this.dialogFormVisible = false
        })
      },

    }
  }
</script>
<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #20a0ff;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
