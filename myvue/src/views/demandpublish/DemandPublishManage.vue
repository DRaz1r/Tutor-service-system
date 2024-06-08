<template>
  <div>
    <div style="margin-bottom: 5px">
      <el-input v-model="userId" placeholder="请输入用户ID  " suffix-icon="el-icon-search" style="width: 136px"
                @keyup.enter.native="loadPost"></el-input>
      <el-select v-model="subject" filterable placeholder="请选择科目" style="margin-left: 5px;">
        <el-option
          v-for="item in subjects"
          :key="item.value"
          :label="item.label"
          :value="item.label">
          :value="item.label">
        </el-option>
      </el-select>

      <el-button type="primary" style="margin-left: 5px" @click="loadPost">查询</el-button>
      <el-button type="success" style="margin-left: 5px" @click="resetParam">重置</el-button>
      <el-button type="primary" style="margin-left: 5px" @click="add">新增</el-button>
    </div>
    <div class="grid-container">
      <div v-for="item in tableData" :key="item.id" class="grid-item">
        <div class="item-content">
          <div class="user-id">{{ item.userId }}</div>
          <div class="tags">
            <span class="tag">{{ item.subjects }}</span>
            <span class="tag">{{ item.grades }}</span>
            <span class="tag">{{ item.availableTimes }}</span>
          </div>
          <div class="requirement">{{ item.requirement }}</div>
          <div class="buttons">
            <el-button size="small" type="success" @click="mod(item)">编辑</el-button>
            <el-popconfirm
              title="确定删除吗？"
              @confirm="del(item.id)">
              <el-button slot="reference" size="small" type="danger">删除</el-button>
            </el-popconfirm>
          </div>
        </div>
      </div>
    </div>
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
        <!--        <el-form-item label="个人简介" prop="introduction">-->
        <!--          <el-col :span="20">-->
        <!--            <el-input type="textarea" v-model="form.introduction"></el-input>-->
        <!--          </el-col>-->
        <!--        </el-form-item>-->
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
      subject:'',
      subjects:[
        {
          value: '2',
          label: '语文'
        }, {
          value: '1',
          label: '数学'
        }, {
          value: '0',
          label: '英语'
        }
      ],
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
          { required: true, message: '请选择科目', trigger: 'blur' },
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
      this.$axios.post(this.$httpUrl+'/demandpublish/save',this.form).then(res=>res.data).then(res=>{
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
      this.$axios.post(this.$httpUrl+'/demandpublish/update',this.form).then(res=>res.data).then(res=>{
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
      this.$axios.post(this.$httpUrl+'/demandpublish/listPage',{
        pageSize:this.pageSize,
        pageNum:this.pageNum,
        param:{
            subject: this.subject,
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
.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); /* 控制列数和每列最小/最大宽度 */
  gap: 20px; /* 设置块之间的间隙 */
}

.grid-item {
  background-color: #fff; /* 设置块的背景色 */
  border: 1px solid #ccc; /* 设置块的边框 */
  border-radius: 5px; /* 设置块的圆角 */
  padding: 20px; /* 设置块的内边距 */
}

.item-content {
  display: flex;
  flex-direction: column;
}

.user-id {
  font-weight: bold;
  font-size: 14px;
  margin-bottom: 10px;
}

.tags {
  margin-bottom: 10px;
}

.tag {
  display: inline-block;
  background-color: #f3f3fd;
  color: #555;
  padding: 4px 8px;
  border-radius: 4px;
  margin-right: 5px;
  margin-bottom: 5px;
}

.requirement {
  margin-bottom: 10px;
}

.buttons {
  display: flex;
  justify-content: space-between;
}
</style>
