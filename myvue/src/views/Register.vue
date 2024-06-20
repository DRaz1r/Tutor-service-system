<template>
    <div class="registerBody">
      <div class="registerDiv">
        <div class="register-content">
          <h1 class="register-title">用户注册</h1>
          <el-form :model="registerForm" label-width="100px" :rules="rules" ref="registerForm">
            <el-form-item label="身份" prop="roleId">
                <el-select style="width: 200px" v-model="registerForm.roleId" placeholder="请选择">
                  <el-option label="老师" value="1"></el-option>
                  <el-option label="学生" value="2"></el-option>
                </el-select>
              </el-form-item>
            <el-form-item label="账号" prop="no">
              <el-input style="width: 200px" type="text" v-model="registerForm.no" autocomplete="off" size="small"></el-input>
            </el-form-item>
            <el-form-item label="名字" prop="name">
              <el-input style="width: 200px" type="text" v-model="registerForm.name" autocomplete="off" size="small"></el-input>
            </el-form-item>
            <el-form-item label="年龄" prop="age">
              <el-input style="width: 200px" type="number" v-model="registerForm.age" autocomplete="off" size="small"></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password">
              <el-input style="width: 200px" type="password" v-model="registerForm.password" show-password autocomplete="off" size="small"></el-input>
            </el-form-item>
            <el-form-item label="电话" prop="phone">
              <el-input style="width: 200px" type="text" v-model="registerForm.phone" autocomplete="off" size="small"></el-input>
            </el-form-item>
            <el-form-item label="性别" prop="sex">
              <el-select style="width: 200px" v-model="registerForm.sex" placeholder="请选择">
                <el-option label="男" value="1"></el-option>
                <el-option label="女" value="2"></el-option>
              </el-select>
            </el-form-item>
            <div class="button-container">
            <el-form-item>
              <el-button type="primary" @click="register" :disabled="register_disabled">注 册</el-button>
            </el-form-item>
            </div>
          </el-form>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "Register",
    data() {
      return {
        register_disabled: false,
        registerForm: {
            id:'',
            no:'',
            name:'',
            password:'',
            age:'',
            phone:'',
            sex:'1',
            roleId:'2'
        },
        rules: {
        no: [
            { required: true, message: '请输入账号', trigger: 'blur' },
            { min: 3, max: 8, message: '长度在 3 到 8 个字符', trigger: 'blur' },
        ],
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' },
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 3, max: 8, message: '长度在 3 到 8 个字符', trigger: 'blur' }
        ],
        age: [
          { required: true, message: '请输入年龄', trigger: 'blur' },
          { min: 1, max: 3, message: '长度在 1 到 3 个字符', trigger: 'blur' },
          { pattern:/^([1-9][0-9]*){1,3}$/, message: '请输入正确的数字', trigger: 'blur' },
        ],
        phone: [
          { required: true, message: '手机号不能为空', trigger: 'blur' },
          { pattern:/^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: '请输入正确的手机号', trigger: 'blur' }
        ],
        }
      };
    },
    methods: {
      register() {
        this.register_disabled = true;
        this.$refs.registerForm.validate((valid) => {
          if (valid) {
            this.$axios.post(this.$httpUrl + '/user/save', this.registerForm).then(res => res.data).then(res => {
              console.log(res);
              if (res.code == 200) {
                alert('注册成功！');
                this.$router.replace('/'); // 跳转到登录页面
              } else {
                this.register_disabled = false;
                alert('注册失败！');
              }
            });
          } else {
            this.register_disabled = false;
            console.log('校验失败');
            return false;
          }
        });
      }
    }
  };
</script>
  
<style scoped>
  .registerBody {
    position: absolute;
    width: 100%;
    height: 100%;
    background-image: url('../assets/images/hittt.png'); /* 添加背景图 */
    background-color: #B3C0D1;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }
  .registerDiv {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -270px;
    margin-left: -250px;
    width: 450px;
    height: 540px;
    background: #fff;
    border-radius: 5%;
  }
  .register-title {
    margin: 20px 0;
    text-align: center;
  }
  .register-content {
    width: 400px;
    height: 320px;
    position: absolute;
    top: 25px;
    left: 25px;
  }
  .button-container {
    display: flex;
    width: 100%;
  }
</style>
  