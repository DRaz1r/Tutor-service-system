<template>
  <div>
    <div style="margin-bottom: 5px">
      <el-select v-model="grade" placeholder="请选择年级" style="margin-left: 5px;">
        <el-option
          v-for="item in grades"
          :key="item.value"
          :label="item.label"
          :value="item.label">
        </el-option>
      </el-select>
      <el-select v-model="subject" filterable placeholder="请选择科目" style="margin-left: 5px;">
        <el-option
          v-for="item in subjects"
          :key="item.value"
          :label="item.label"
          :value="item.label">
        </el-option>
      </el-select>

      <el-button type="primary" style="margin-left: 5px" @click="loadPost">查询</el-button>
      <el-button type="success" style="margin-left: 5px" @click="resetParam">重置</el-button>
      <el-button type="warning" style="margin-left: 5px" @click="add">新增</el-button>
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
        </div>
      </div>
    </div>

    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pageNum"
      :page-sizes="[3, 5, 9]"
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
      dialogVisible: false,
      subject:'',
      grade:'',
      // subjects:[
      //   {
      //     value: '2',
      //     label: '语文'
      //   }, {
      //     value: '1',
      //     label: '数学'
      //   }, {
      //     value: '0',
      //     label: '英语'
      //   }
      // ],

      // 科目选项
      subjects: [
        { value: '语文', label: '语文' },
        { value: '数学', label: '数学' },
        { value: '英语', label: '英语' },
        { value: '生物', label: '生物' },
        { value: '化学', label: '化学' },
        { value: '物理', label: '物理' },
        { value: '政治', label: '政治' },
        { value: '历史', label: '历史' },
        { value: '地理', label: '地理' }
      ],

      grades: [
        { value: '一年级', label: '一年级' },
        { value: '二年级', label: '二年级' },
        { value: '三年级', label: '三年级' },
        { value: '四年级', label: '四年级' },
        { value: '五年级', label: '五年级' },
        { value: '六年级', label: '六年级' },
        { value: '初一', label: '初一' },
        { value: '初二', label: '初二' },
        { value: '初三', label: '初三' },
        { value: '高一', label: '高一' },
        { value: '高二', label: '高二' },
        { value: '高三', label: '高三' },
        { value: '考研', label: '考研' }
      ],
      form: {
        userId: '',
        subjects: '',
        grades: '',
        availableTimes: '',
        requirement: '',
      },
      rules: {
        user_id: [
          { required: true, message: '请输入用户ID', trigger: 'blur' },
        ],
        subjects: [
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
            grade: this.grade,
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
      this.subject = '';
      this.grade = '';
      this.loadPost();
    }
  },
  beforeMount() {
    this.loadPost();
  }
};
</script>

<!--.grid-container {-->
<!--display: grid;-->
<!--grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); /* 控制列数和每列最小/最大宽度 */-->
<!--gap: 20px; /* 设置块之间的间隙 */-->
<!--}-->

<!--.grid-item {-->
<!--background-color: #fff; /* 设置块的背景色 */-->
<!--border: 1px solid #ccc; /* 设置块的边框 */-->
<!--border-radius: 5px; /* 设置块的圆角 */-->
<!--padding: 20px; /* 设置块的内边距 */-->
<!--}-->

<style scoped>

.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(310px, 1fr)); /* 控制列数和每列最小/最大宽度 */
  gap: 30px; /* 设置块之间的间隙 */
  width: 100%; /* 设置宽度为100%，充满整个容器 */
  max-width: 1200px; /* 设置最大宽度以避免内容溢出 */
  margin: 0 auto; /* 水平居中容器 */
}

.grid-item {
  background-color: #fff; /* 设置块的背景色 */
  border: 1px solid #ccc; /* 设置块的边框 */
  border-radius: 5px; /* 设置块的圆角 */
  padding: 20px; /* 设置块的内边距 */
  width: 80%; /* 设置每个子项的宽度为100%，以填充容器 */
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
