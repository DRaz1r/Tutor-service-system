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
        </el-option>
      </el-select>

      <el-button type="primary" style="margin-left: 5px" @click="loadPost">查询</el-button>
      <el-button type="success" style="margin-left: 5px" @click="resetParam">重置</el-button>
      <el-button type="primary" style="margin-left: 5px" @click="add">新增</el-button>
    </div>
    <div class="grid-container">
      <div v-for="item in tableData" :key="item.id" class="grid-item">
        <div class="item-content">
          <!-- 用户名固定在左上角 -->
          <div class="user-name">{{ item.userName }}</div>
          
          <!-- 图片占据整个块的宽度 -->
          <div class="user-avatar-container">
            <img class="user-avatar" :src="backendUrl+item.imageUrl" alt="用户头像">
          </div>
    
          <!-- 标签竖直排列在图片的左侧 -->
          <div class="tags">
            <span class="tag">{{ item.subjects }}</span>
            <span class="tag">{{ item.grades }}</span>
            <span class="tag">{{ item.availableTimes }}</span>
          </div>
    
          <!-- 个人简介显示在图片的下方 -->
          <div class="introduction">{{ item.introduction }}</div>
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
        <el-form-item label="个人简介" prop="introduction">
          <el-col :span="20">
            <el-input type="textarea" v-model="form.introduction"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="上传图片">
          <el-upload
            action="http://localhost:8081/file/upload"
            list-type="picture"
            :on-success="handleUploadSuccess"
            :on-error="handleUploadError">
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
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
      userId:'',
      subject:'',
      type: '',
      backendUrl: 'http://localhost:8081',
      dialogVisible: false,
      form: {
        id: '',
        userId: '',
        subjects: '',
        grades: '',
        availableTimes: '',
        introduction: '',
        imageUrl: '' // 存储上传图片的URL
      },
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
    handleUploadSuccess(response, file) {
      this.form.imageUrl = response.data;
    },
    handleUploadError(err, file) {
      console.error('上传失败:', err);
    },
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
            subject: this.subject+'',
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
  grid-template-columns: repeat(auto-fill, minmax(400px, 1fr)); /* 网格布局，每行最多容纳三个项目 */
  gap: 20px; /* 项目之间的间隔 */
}

.grid-item {
  background-color: #f9f9f9; /* 网格项目背景色 */
  padding: 10px; /* 网格项目内边距 */
}

.item-content {
  position: relative; /* 项目内容相对定位 */
  padding: auto;
}

.user-name {
  position: absolute; /* 用户名绝对定位，固定在左上角 */
  top: 10px;
  left: 10px;
  margin-bottom: 20px;
  background-color:burlywood;
}

.user-avatar-container {
  margin-bottom: 10px; /* 图片容器底部留白 */
}

.user-avatar {
  width: 100%; /* 图片占据整个容器宽度 */
  height: auto; /* 高度自动调整 */
}

.tags {
  position: absolute; /* 标签绝对定位，相对于图片的左侧 */
  top: 10px;
  left: 10px;
  display: flex;
  margin-top: 20px;
  margin-bottom: 20px;
  flex-direction: column; /* 标签竖直排列 */
}

.tag {
  margin-bottom: 10px; /* 标签之间的垂直间距 */
  margin-top: 10px;
  background-color:aqua;
}

.introduction {
  margin-top: 10px; /* 个人简介与图片底部的垂直间距 */
}

</style>
