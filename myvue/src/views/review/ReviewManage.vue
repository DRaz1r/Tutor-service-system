<template>
  <div>
    <div style="margin-bottom: 5px">
      <el-input v-model="name" placeholder="请输入评价人" suffix-icon="el-icon-search" style="width: 200px"
                @keyup.enter.native="loadPost"></el-input>
      <el-button type="primary" style="margin-left: 5px" @click="loadPost">查询</el-button>
      <el-button type="success" style="margin-left: 5px" @click="resetParam" >重置</el-button>
      <el-button type="warning" style="margin-left: 5px" @click="add">新增</el-button>
    </div>
    <el-table :data="tableData"
              :header-cell-style="{background:'#f3f3fd',color:'#555'}"
              border
    >
      <el-table-column prop="id" label="ID" width="100">
        <template slot-scope="scope">
          <div style="height: 56px; font-size: 16px;">
            {{ scope.row.id}}
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="name" label="评价人" width="200">
        <template slot-scope="scope">
          <div style="height: 56px; font-size: 16px;">
            {{ scope.row.name }}
          </div>
        </template>
      </el-table-column>

      <el-table-column prop="remark" label="评价内容" >
        <template slot-scope="scope">
          <div style="height: 56px; font-size: 16px;">
            {{ scope.row.remark }}
          </div>
        </template>
      </el-table-column>
      <el-table-column v-if="isAdmin" prop="operate" label="操作" width="170">
        <template slot-scope="scope">
          <el-button size="small" type="success" @click="mod(scope.row)">编辑</el-button>
          <el-popconfirm
            title="确定删除吗？"
            @confirm="del(scope.row.id)"
            style="margin-left: 5px;"
          >
            <el-button slot="reference" size="small" type="danger">删除</el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pageNum"
      :page-sizes="[5, 10]"
      :page-size="pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total">
    </el-pagination>
    <el-dialog
      title="提示"
      :visible.sync="centerDialogVisible"
      width="30%"
      center>
      <el-form ref="form" :rules="rules" :model="form" label-width="70px">
        <el-form-item label="评价人" prop="name">
          <el-col :span="20">
            <el-input v-model="form.name" :disabled="isNameDisabled"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="评价内容" prop="remark">
          <el-col :span="20">
            <el-input type="textarea" v-model="form.remark"></el-input>
          </el-col>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
    <el-button @click="centerDialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="save">确 定</el-button>
  </span>
    </el-dialog>
  </div>

</template>

<script>
export default {
  name: "ReviewManage",
  data() {

    return {
      username: '',
      isNameDisabled: false,
      isAdmin: false,
      tableData:[],
      pageSize:10,
      pageNum:1,
      total:0,
      name:'',
      centerDialogVisible:false,
      form:{
        id:'',
        name:'',
        remark:''
      },
      rules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' },
        ]
      }
    }
  },
  methods:{
    resetForm() {
      this.$refs.form.resetFields();
    },
    add(){
      this.centerDialogVisible=true
      this.$nextTick(()=>{
        this.resetForm()
      })
    },
    mod(row){
      this.centerDialogVisible = true
      this.$nextTick(()=>{
        //赋值到表单
        this.form.id = row.id
        this.form.name = row.name
        this.form.remark = row.remark
      })
    },
    del(id){
      console.log(id)

      this.$axios.get(this.$httpUrl+'/review/delete?id='+id).then(res=>res.data).then(res=>{
        console.log(res)
        if(res.code==200){
          this.$message({
            message: '操作成功！',
            type: 'success'
          });
          this.loadPost()
        }else{
          this.$message({
            message: '操作失败！',
            type: 'error'
          });
        }

      })

    },
    doSave(){
      this.$axios.post(this.$httpUrl+'/review/save',this.form).then(res=>res.data).then(res=>{
        console.log(res)
        if(res.code==200){
          this.$message({
            message: '操作成功！',
            type: 'success'
          });
          this.centerDialogVisible = false
          this.loadPost()
          this.resetForm()
        }else{
          this.$message({
            message: '操作失败！',
            type: 'error'
          });
        }

      })
    },
    doMod(){
      this.$axios.post(this.$httpUrl+'/review/update',this.form).then(res=>res.data).then(res=>{
        console.log(res)
        if(res.code==200){
          this.$message({
            message: '操作成功！',
            type: 'success'
          });
          this.centerDialogVisible = false
          this.loadPost()
          this.resetForm()
        }else{
          this.$message({
            message: '操作失败！',
            type: 'error'
          });
        }

      })
    },
    save(){
      this.$refs.form.validate((valid) => {
        if (valid) {
          if(this.form.id){
            this.doMod();
          }else{
            this.doSave();
          }
        } else {
          console.log('error submit!!');
          return false;
        }
      });

    },

    loadPost(){
      this.$axios.post(this.$httpUrl+'/review/listPage',{
        pageSize:this.pageSize,
        pageNum:this.pageNum,
        param:{
          name:this.name,
        }
      }).then(res=>res.data).then(res=>{
        console.log(res)
        if(res.code==200){
          this.tableData=res.data;
          this.total=res.total;
        }else {
          alert('获取数据失败')
        }

      })
    },
    handleSizeChange(val) {
      console.log(`每页 ${val} 条`);
      this.pageNum=1
      this.pageSize=val
      this.loadPost()
    },
    handleCurrentChange(val) {
      console.log(`当前页: ${val}`);
      this.pageNum=val
      this.loadPost()
    },
    resetParam(){
      this.name=''
    }
  },
  beforeMount() {
    const userStr = sessionStorage.getItem("CurUser");
    if (userStr) {
      const user = JSON.parse(userStr);
      this.form.name = user.name;
      // 设置输入框为不可编辑
      this.isNameDisabled = true;
      if (user.roleId == 0) {
        this.isAdmin = true;
      }
    }
    this.loadPost()
  }


}
</script>

<style scoped>

</style>
