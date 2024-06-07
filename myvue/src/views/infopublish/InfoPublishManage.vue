<template>
  <div>
    <div style="margin-bottom: 5px">
      <el-input v-model="userId" placeholder="请输入用户ID" suffix-icon="el-icon-search" style="width: 120px"
                @keyup.enter.native="loadPost"></el-input>
      <el-select v-model="type" placeholder="请选择类型" style="margin-left: 5px;width: 120px">
        <el-option label="teacher" value="teacher"></el-option>
        <el-option label="student" value="student"></el-option>
      </el-select>

      <el-button type="primary" style="margin-left: 5px" @click="loadPost">查询</el-button>
      <el-button type="success" style="margin-left: 5px" @click="resetParam">重置</el-button>
      <el-button type="primary" style="margin-left: 5px" @click="add">新增</el-button>
    </div>
    <el-table :data="tableData"
              :header-cell-style="{background:'#f3f3fd',color:'#555'}"
              border
              highlight-current-row
              @current-change="selectCurrentChange">
      <el-table-column prop="id" label="ID" width="80px"></el-table-column>
      <el-table-column prop="userId" label="用户ID" width="100px"></el-table-column>
      <el-table-column prop="type" label="类型" width="100px"></el-table-column>
      <el-table-column prop="subjects" label="科目" width="100px"></el-table-column>
      <el-table-column prop="grades" label="年级" width="100px"></el-table-column>
      <el-table-column prop="availableTimes" label="时间" width="100px"></el-table-column>
      <el-table-column prop="requirement" label="家教需求"></el-table-column>
      <el-table-column prop="introduction" label="个人简介"></el-table-column>
      <el-table-column prop="operate" label="操作" width="150px">
        <template slot-scope="scope">
          <el-button size="small" type="success" @click="mod(scope.row)">编辑</el-button>
          <el-popconfirm
            title="确定删除吗？"
            @confirm="del(scope.row.id)"
            style="margin-left: 5px;">
            <el-button slot="reference" size="small" type="danger">删除</el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pageNum"
      :page-sizes="[2, 5, 7]"
      :page-size="pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total">
    </el-pagination>
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible"
      width="30%"
      center>
      <el-form ref="form" :rules="rules" :model="form" label-width="70px">
        <el-form-item label="用户ID" prop="userId">
          <el-col :span="20">
            <el-input v-model="form.userId"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="类型" prop="type">
          <el-col :span="20">
            <el-select v-model="form.type" placeholder="请选择类型">
              <el-option label="teacher" value="teacher"></el-option>
              <el-option label="student" value="student"></el-option>
            </el-select>
          </el-col>
        </el-form-item>
        <el-form-item label="科目" prop="subjects">
          <el-col :span="20">
            <el-input v-model="form.subjects"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="年级" prop="grades">
          <el-col :span="20">
            <el-input v-model="form.grades"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="时间" prop="availableTimes">
          <el-col :span="20">
            <el-input v-model="form.availableTimes"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="家教需求" prop="requirement">
          <el-col :span="20">
            <el-input type="textarea" v-model="form.requirement"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="个人简介" prop="introduction">
          <el-col :span="20">
            <el-input type="textarea" v-model="form.introduction"></el-input>
          </el-col>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="save">确定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tableData: [],
      pageSize: 5,
      pageNum: 1,
      total: 0,
      userId: '',
      type: '',
      dialogVisible: false,
      form: {
        id: '',
        userId: '',
        type: '',
        subjects: '',
        grades: '',
        availableTimes: '',
        requirement: '',
        introduction: ''
      },
      rules: {
        user_id: [
          { required: true, message: '请输入用户ID', trigger: 'blur' },
        ],
        type: [
          { required: true, message: '请选择类型', trigger: 'blur' },
        ]
      }
    };
  },
  methods: {
    selectCurrentChange(val) {
      this.currentRow = val;
    },
    resetForm() {
      this.$refs.form.resetFields();
    },
    add() {
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.resetForm();
      });
    },
    mod(row) {
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.form = { ...row };
      });
    },
    del(id) {
      // 删除数据的axios请求
      console.log(id);
    },
    save() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          if (this.form.id) {
            this.doMod();
          } else {
            this.doSave();
          }
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    doSave() {
      this.$axios.post(this.$httpUrl+'/infopublish/save',this.form).then(res=>res.data).then(res=>{
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
    doMod() {
     this.$axios.post(this.$httpUrl+'/infopublish/update',this.form).then(res=>res.data).then(res=>{
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
    loadPost() {
      this.$axios.post(this.$httpUrl+'/infopublish/listPage',{
        pageSize:this.pageSize,
        pageNum:this.pageNum,
        param:{
        //   goodstype: this.goodstype+'',
        //   storage: this.storage+''
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
      this.pageSize = val;
      this.loadPost();
    },
    handleCurrentChange(val) {
      this.pageNum = val;
      this.loadPost();
    },
    resetParam() {
      this.userId = '';
      this.type = '';
    }
  },
  beforeMount() {
    this.loadPost();
  }
};
</script>

<style scoped>
</style>
