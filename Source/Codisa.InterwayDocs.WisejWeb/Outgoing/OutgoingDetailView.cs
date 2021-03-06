﻿using System;
using System.Collections.Generic;
using Codisa.InterwayDocs.Business;
using Codisa.InterwayDocs.Framework;
using MvvmFx.CaliburnMicro;
using MvvmFx.Bindings.Data;
using Binding = MvvmFx.Bindings.Data.Binding;

namespace Codisa.InterwayDocs.Outgoing
{
    public partial class OutgoingDetailView : DetailViewBase, IHaveDataContext
    {
        #region Fields and properties

        private bool _isBindingSet;

        #endregion

        #region Initializers

        public OutgoingDetailView()
        {
            Visible = false;
            InitializeComponent();
            StandardViewHeight = Height;
            //model_RegisterDate.Focus();

            AlwaysVisibleElements = new List<string>();
            AlwaysVisibleElements.Add(whenEmptyCreateRegister.Name);
            AlwaysVisibleElements.Add(detailPanel.Name);
            AlwaysVisibleElements.Add(createRegister.Name);
            AlwaysVisibleElements.Add(editDetail.Name);
            AlwaysVisibleElements.Add(cancel.Name);
            AlwaysVisibleElements.Add(save.Name);
            AlwaysVisibleElements.Add(printDetail.Name);
            AlwaysVisibleElements.Add(toggleDetailPanel.Name);

            BaseDetailPanel = detailPanel;
            BaseToggleDetailPanel = toggleDetailPanel;
            BaseWhenEmptyCreateRegister = whenEmptyCreateRegister;
            BaseErrorWarnInfoProvider = errorWarnInfoProvider;
        }

        #endregion

        #region Override events

        protected new void ForceValidation(object sender, EventArgs e)
        {
            base.ForceValidation(sender, e);
        }

        #endregion

        #region IHaveDataContext implementation

        public event EventHandler<DataContextChangedEventArgs> DataContextChanged = delegate { };

        public object DataContext
        {
            get { return ViewModel; }
            set
            {
                if (value != ViewModel)
                {
                    var viewModel = value as OutgoingDetailViewModel;
                    if (viewModel != null)
                    {
                        IsNotifying = true;

                        ViewModel = viewModel;
                        ParentViewModel = viewModel.ParentViewModel;
                        if (ParentViewModel.RootViewModel.UseLongNameEntities)
                        {
                            model_DocumentEntity.MaxLength = 150;
                            model_DocumentDept.MaxLength = 150;
                            model_RecipientName.MaxLength = 150;
                        }

                        if (viewModel.Model.RegisterId != 0)
                        {
                            SetConfiguration();
                            SetResources();
                            Bind();
                            DataContextChanged(this, new DataContextChangedEventArgs());
                            Visible = true;
                        }
                    }
                }
            }
        }

        private void Bind()
        {
            if (_isBindingSet)
                return;

            BindingManager.BindOnValidation = true;

            var binding = new Binding();
            binding.SourceObject = ViewModel;
            binding.SourcePath = "DisplayName";
            binding.TargetObject = detailPanel;
            binding.TargetPath = "Text";
            binding.Mode = BindingMode.OneWayToTarget;
            BindingManager.Bindings.Add(binding);

            var bindingRegisterId = new Binding();
            bindingRegisterId.SourceObject = ViewModel;
            bindingRegisterId.SourcePath = "DisplayName";
            bindingRegisterId.TargetObject = registerId;
            bindingRegisterId.TargetPath = "Text";
            bindingRegisterId.Mode = BindingMode.OneWayToTarget;
            BindingManager.Bindings.Add(bindingRegisterId);

            BindText(model_RegisterDate);
            BindText(model_DocumentType);
            BindText(model_DocumentReference);
            BindText(model_DocumentEntity);
            BindText(model_DocumentDept);
            BindText(model_DocumentClass);
            BindText(model_DocumentDate);
            BindText(model_Subject);
            BindText(model_SendDate);
            BindText(model_RecipientName);
            BindText(model_RecipientTown);
            BindText(model_ArchiveLocation);
            BindText(model_Notes);

            errorWarnInfoProvider.DataSource = ViewModel.Model;

            BindFormReadOnly();
            BindTextBoxReadOnly(model_RegisterDate);
            BindTextBoxReadOnly(model_DocumentType);
            BindTextBoxReadOnly(model_DocumentReference);
            BindTextBoxReadOnly(model_DocumentEntity);
            BindTextBoxReadOnly(model_DocumentDept);
            BindTextBoxReadOnly(model_DocumentClass);
            BindTextBoxReadOnly(model_DocumentDate);
            BindTextBoxReadOnly(model_Subject);
            BindTextBoxReadOnly(model_SendDate);
            BindTextBoxReadOnly(model_RecipientName);
            BindTextBoxReadOnly(model_RecipientTown);
            BindTextBoxReadOnly(model_ArchiveLocation);
            BindTextBoxReadOnly(model_Notes);

            _isBindingSet = true;
        }

        private void SetConfiguration()
        {
            var iHaveConfigurationList = ViewModel as IHaveConfigurationList;
            if (iHaveConfigurationList != null)
            {
                var configurationList = iHaveConfigurationList.ConfigurationList;

                Helper.SetElementConfiguration(registerDateLabel, configurationList);
                Helper.SetElementConfiguration(model_RegisterDate, configurationList);
                Helper.SetElementConfiguration(documentTypeLabel, configurationList);
                Helper.SetElementConfiguration(model_DocumentType, configurationList);
                Helper.SetElementConfiguration(documentReferenceLabel, configurationList);
                Helper.SetElementConfiguration(model_DocumentReference, configurationList);
                Helper.SetElementConfiguration(documentEntityLabel, configurationList);
                Helper.SetElementConfiguration(model_DocumentEntity, configurationList);
                Helper.SetElementConfiguration(documentDeptLabel, configurationList);
                Helper.SetElementConfiguration(model_DocumentDept, configurationList);
                Helper.SetElementConfiguration(documentClassLabel, configurationList);
                Helper.SetElementConfiguration(model_DocumentClass, configurationList);
                Helper.SetElementConfiguration(documentDateLabel, configurationList);
                Helper.SetElementConfiguration(model_DocumentDate, configurationList);
                Helper.SetElementConfiguration(subjectLabel, configurationList);
                Helper.SetElementConfiguration(model_Subject, configurationList);
                Helper.SetElementConfiguration(sendDateLabel, configurationList);
                Helper.SetElementConfiguration(model_SendDate, configurationList);
                Helper.SetElementConfiguration(recipientNameLabel, configurationList);
                Helper.SetElementConfiguration(model_RecipientName, configurationList);
                Helper.SetElementConfiguration(recipientTownLabel, configurationList);
                Helper.SetElementConfiguration(model_RecipientTown, configurationList);
                Helper.SetElementConfiguration(notesLabel, configurationList);
                Helper.SetElementConfiguration(model_Notes, configurationList);
                Helper.SetElementConfiguration(model_ArchiveLocation, configurationList);
                Helper.SetElementConfiguration(archiveLocationLabel, configurationList);
            }
        }

        #endregion

        #region Translations

        public override void RefreshTranslation()
        {
            base.RefreshTranslation();

            SetConfiguration();
            SetResources();
        }

        private void SetResources()
        {
            toggleDetailPanel.ToolTipText = "ToolTipHideDetail".GetUiTranslation();
            printDetail.ToolTipText = "ToolTipExportRegisterExcel".GetUiTranslation();
            cancel.ToolTipText = "ToolTipCancel".GetUiTranslation();
            save.ToolTipText = "ToolTipSave".GetUiTranslation();
            editDetail.ToolTipText = "ToolTipEdit".GetUiTranslation();
            createRegister.ToolTipText = "ToolTipNew".GetUiTranslation();
            toolTip.SetToolTip(registerDateLabel, "ToolTipRegisterDate".GetUiTranslation());
            documentGroup.Text = "LabelDocument".GetUiTranslation();
            toolTip.SetToolTip(documentTypeLabel, "ToolTipDocumentType".GetUiTranslation());
            toolTip.SetToolTip(documentReferenceLabel, "ToolTipDocumentNumber".GetUiTranslation());
            toolTip.SetToolTip(documentEntityLabel, "ToolTipDocumentEntity".GetUiTranslation());
            toolTip.SetToolTip(documentDeptLabel, "ToolTipDocumentDept".GetUiTranslation());
            toolTip.SetToolTip(documentClassLabel, "ToolTipDocumentClass".GetUiTranslation());
            toolTip.SetToolTip(documentDateLabel, "ToolTipDocumentDate".GetUiTranslation());
            toolTip.SetToolTip(subjectLabel, "ToolTipSubject".GetUiTranslation());
            toolTip.SetToolTip(sendDateLabel, "ToolTipSendDate".GetUiTranslation());
            toolTip.SetToolTip(recipientNameLabel, "ToolTipRecipientName".GetUiTranslation());
            toolTip.SetToolTip(recipientTownLabel, "ToolTipRecipientTown".GetUiTranslation());
            archiveLocationLabel.Text = "LabelArchiveLocation".GetUiTranslation();
            toolTip.SetToolTip(archiveLocationLabel, "ToolTipLocation".GetUiTranslation());
            whenEmptyCreateRegister.Text = "LabelClickCreateOutgoing".GetUiTranslation();
        }

        #endregion
    }
}