<template>
  <div>
    <div style="margin-bottom: 5px">
      <el-select v-model="grade" filterable placeholder="请选择年级" style="margin-left: 5px;">
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
      <el-button type="info" style="margin-left: 5px" @click="recommend">推荐</el-button>
    </div>

    <div class="grid-container">
      <info-publish-item
        v-for="item in tableData"
        :key="item.id"
        :item="item"
        :backend-url="backendUrl"
        @like="handleLike">
      </info-publish-item>
    </div>

    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pageNum"
      :page-sizes="[3, 6, 9]"
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
        <el-form-item label="标题" prop="title">
          <el-col :span="20">
            <el-input v-model="form.title"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="用户ID" prop="userId">
          <el-col :span="20">
            <el-input v-model="form.userId" :disabled="isUserIdDisabled"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="科目" prop="subjects">
          <el-col :span="20">
            <el-select v-model="form.subjects" placeholder="请选择科目">
              <el-option
                v-for="subject in subjects"
                :key="subject.value"
                :label="subject.label"
                :value="subject.value">
              </el-option>
            </el-select>
          </el-col>
        </el-form-item>
        <el-form-item label="年级" prop="grades">
          <el-col :span="20">
            <el-select v-model="form.grades" placeholder="请选择年级">
              <el-option
                v-for="grade in grades"
                :key="grade.value"
                :label="grade.label"
                :value="grade.value">
              </el-option>
            </el-select>
          </el-col>
        </el-form-item>
        <el-form-item label="时间" prop="days">
          <el-col :span="20">
            <el-select v-model="form.days" placeholder="请选择星期">
              <el-option
                v-for="day in days"
                :key="day.value"
                :label="day.label"
                :value="day.value">
              </el-option>
            </el-select>
            <el-select v-model="form.periods" placeholder="请选择时间段" style="margin-top: 10px;">
              <el-option
                v-for="period in periods"
                :key="period.value"
                :label="period.label"
                :value="period.value">
              </el-option>
            </el-select>
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
import InfoPublishItem from './InfoPublishItem.vue';
export default {
  components: {
    InfoPublishItem
  },
  data() {
    return {
      isUserIdDisabled: false,
      tableData: [],
      showFullIntroduction: {},
      pageSize: 6,
      pageNum: 1,
      total: 0,
      grade: '',
      subject: '',
      backendUrl: 'http://localhost:8081',
      dialogVisible: false,
      form: {
        title: '',
        id: '',
        userId: '',
        subjects: '',
        grades: '',
        days: '',
        periods: '',
        introduction: '',
        imageUrl: '', // 存储上传图片的URL
        likes: ''
      },
      // 科目选项
      subjects: [
        {value: '语文', label: '语文'},
        {value: '数学', label: '数学'},
        {value: '英语', label: '英语'},
        {value: '生物', label: '生物'},
        {value: '化学', label: '化学'},
        {value: '物理', label: '物理'},
        {value: '政治', label: '政治'},
        {value: '历史', label: '历史'},
        {value: '地理', label: '地理'}
      ],
      // 年级选项
      grades: [
        {value: '一年级', label: '一年级'},
        {value: '二年级', label: '二年级'},
        {value: '三年级', label: '三年级'},
        {value: '四年级', label: '四年级'},
        {value: '五年级', label: '五年级'},
        {value: '六年级', label: '六年级'},
        {value: '初一', label: '初一'},
        {value: '初二', label: '初二'},
        {value: '初三', label: '初三'},
        {value: '高一', label: '高一'},
        {value: '高二', label: '高二'},
        {value: '高三', label: '高三'},
        {value: '考研', label: '考研'}
      ],
      // 星期选项
      days: [
        {value: '周一', label: '星期一'},
        {value: '周二', label: '星期二'},
        {value: '周三', label: '星期三'},
        {value: '周四', label: '星期四'},
        {value: '周五', label: '星期五'},
        {value: '周六', label: '星期六'},
        {value: '周日', label: '星期天'}
      ],
      // 时间段选项
      periods: [
        {value: '上午', label: '上午'},
        {value: '下午', label: '下午'},
        {value: '晚上', label: '晚上'}
      ],
      rules: {
        userId: [{required: true, message: '请输入用户ID', trigger: 'blur'},],
        title: [{required: true, message: '请输入标题', trigger: 'blur'}],
        subjects: [{required: true, message: '请选择科目', trigger: 'change'}],
        grades: [{required: true, message: '请选择年级', trigger: 'change'}],
        days: [{required: true, message: '请选择星期', trigger: 'change'}],
        periods: [{required: true, message: '请选择时间段', trigger: 'change'}]
      }
    };
  },
  methods: {
    handleLike(itemId) {
      const item = this.tableData.find(item => item.id === itemId);
      if (item) {
        item.likes += 1;
        // 更新后端数据库
        this.$axios.post(this.$httpUrl + '/infopublish/update', item).then(res => res.data).then(res => {
          if (res.code === 200) {
            this.$message({
              message: '点赞成功！',
              type: 'success'
            });
          } else {
            this.$message({
              message: '点赞失败！',
              type: 'error'
            });
          }
        });
      }
    },

    animateBtn(event) {
      // 获取触发事件的元素
      const button = event.currentTarget;
      console.log(`Clicked button type:`, button.dataset.type);
      button.classList.add('animate__animated', 'animate__bounce');
      button.addEventListener('animationend', () => {
        button.classList.remove('animate__animated', 'animate__bounce');
      }, {once: true}); // 一次性事件监听器，确保在动画结束后只执行一次
    },

    toggleIntroduction(id) {
      if (!this.showFullIntroduction[id]) {
        this.$set(this.showFullIntroduction, id, true);
      } else {
        this.showFullIntroduction[id] = !this.showFullIntroduction[id];
      }
    },
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
        this.form = {...row};
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
      this.$axios.post(this.$httpUrl + '/infopublish/save', this.form).then(res => res.data).then(res => {
        console.log(res)
        if (res.code == 200) {

          this.$message({
            message: '操作成功！',
            type: 'success'
          });
          this.centerDialogVisible = false
          this.loadPost()
          this.resetForm()
        } else {
          this.$message({
            message: '操作失败！',
            type: 'error'
          });
        }
      })
    },
    doMod() {
      this.$axios.post(this.$httpUrl + '/infopublish/update', this.form).then(res => res.data).then(res => {
        console.log(res)
        if (res.code == 200) {
          this.$message({
            message: '操作成功！',
            type: 'success'
          });
          this.centerDialogVisible = false
          this.loadPost()
          this.resetForm()
        } else {
          this.$message({
            message: '操作失败！',
            type: 'error'
          });
        }

      })
    },
    loadPost() {
      this.$axios.post(this.$httpUrl + '/infopublish/listPage', {
        pageSize: this.pageSize,
        pageNum: this.pageNum,
        param: {
          subject: this.subject + '',
          grade: this.grade + '',
        }
      }).then(res => res.data).then(res => {
        console.log(res)
        if (res.code == 200) {
          this.tableData = res.data;
          this.total = res.total;
        } else {
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
    },
    recommend() {
      // 按照 likes 字段排序
      this.tableData.sort((a, b) => b.likes - a.likes);
      // 这里可以写具体推荐
    },
  },
  beforeMount() {
    const userStr = sessionStorage.getItem("CurUser");
    if (userStr) {
      const user = JSON.parse(userStr);
      // 判断 user.roleId 是否不为 0
      if (user.roleId !== 0) {
        // 设置 form.userId 的值
        this.form.userId = user.id;
        // 设置输入框为不可编辑
        this.isUserIdDisabled = true;
      }
    }
    this.loadPost();
  }
};
</script>

<style scoped>
.grid-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}

.grid-item {
  flex: 1 1 calc(33.333% - 20px);
  background-color: #fff;
  border: 1px solid #eaeaea;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: all 0.2s;
}

.el-button {
  margin: 0 5px;
}

</style>
